from .gemini_service import GeminiService
from ..models.schemas import VisionAnalysisResponse
import logging

logger = logging.getLogger(__name__)

class VisionService:
    def __init__(self):
        self.gemini = GeminiService()
    
    async def analyze_room_image(self, image_data: bytes) -> VisionAnalysisResponse:
        """Analyze uploaded room image and extract structural information"""
        
        vision_prompt = """
        You are a professional architect and interior designer. Analyze this room image and provide detailed information.
        
        Return the analysis in this exact JSON format:
        {
            "room_type": "bedroom/living_room/kitchen/bathroom/office/dining_room",
            "wall_colors": "describe current wall colors and finishes",
            "windows": "describe window count, size, and placement",
            "doors": "describe door locations and types",
            "existing_furniture": ["list", "all", "visible", "furniture", "items"],
            "lighting_condition": "describe natural and artificial lighting",
            "free_space_walls": "identify which walls have available space",
            "structural_limitations": "note any structural constraints or features"
        }
        
        Be specific and detailed in your analysis. Focus on actionable design information.
        """
        
        try:
            response = await self.gemini.analyze_image_with_prompt(image_data, vision_prompt)
            
            # Parse the structured response
            analysis_data = await self.gemini.generate_structured_response(
                f"Convert this room analysis to the required JSON format: {response}"
            )
            
            return VisionAnalysisResponse(**analysis_data)
            
        except Exception as e:
            logger.error(f"Error in room image analysis: {e}")
            # Return default analysis on error
            return VisionAnalysisResponse(
                room_type="unknown",
                wall_colors="Unable to analyze",
                windows="Unable to analyze",
                doors="Unable to analyze", 
                existing_furniture=[],
                lighting_condition="Unable to analyze",
                free_space_walls="Unable to analyze",
                structural_limitations="Analysis failed"
            )