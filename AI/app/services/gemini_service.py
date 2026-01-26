import google.generativeai as genai
import os
from typing import Optional, Dict, Any
import json
import logging

logger = logging.getLogger(__name__)

class GeminiService:
    def __init__(self):
        self.api_key = os.getenv("GEMINI_API_KEY")
        if not self.api_key:
            raise ValueError("GEMINI_API_KEY not found in environment variables")
        
        genai.configure(api_key=self.api_key)
        
        # Initialize models
        self.flash_model = genai.GenerativeModel('gemini-1.5-flash')
        self.pro_model = genai.GenerativeModel('gemini-1.5-pro')
    
    async def generate_text(self, prompt: str, model_type: str = "flash") -> str:
        """Generate text using specified Gemini model"""
        try:
            model = self.flash_model if model_type == "flash" else self.pro_model
            response = model.generate_content(prompt)
            return response.text
        except Exception as e:
            logger.error(f"Error generating text: {e}")
            raise
    
    async def analyze_image_with_prompt(self, image_data: bytes, prompt: str) -> str:
        """Analyze image using Gemini Pro vision capabilities"""
        try:
            # Convert bytes to PIL Image for Gemini
            import io
            from PIL import Image
            
            image = Image.open(io.BytesIO(image_data))
            response = self.pro_model.generate_content([prompt, image])
            return response.text
        except Exception as e:
            logger.error(f"Error analyzing image: {e}")
            raise
    
    async def generate_structured_response(self, prompt: str, model_type: str = "flash") -> Dict[str, Any]:
        """Generate structured JSON response"""
        try:
            structured_prompt = f"""
            {prompt}
            
            IMPORTANT: Return ONLY valid JSON format. No additional text or explanations.
            """
            
            response = await self.generate_text(structured_prompt, model_type)
            
            # Clean response and parse JSON
            cleaned_response = response.strip()
            if cleaned_response.startswith("```json"):
                cleaned_response = cleaned_response[7:-3]
            elif cleaned_response.startswith("```"):
                cleaned_response = cleaned_response[3:-3]
            
            return json.loads(cleaned_response)
        except json.JSONDecodeError as e:
            logger.error(f"JSON parsing error: {e}")
            # Fallback: try to extract JSON from response
            try:
                start = response.find('{')
                end = response.rfind('}') + 1
                if start != -1 and end != 0:
                    return json.loads(response[start:end])
            except:
                pass
            raise ValueError("Failed to parse JSON response from Gemini")
        except Exception as e:
            logger.error(f"Error generating structured response: {e}")
            raise