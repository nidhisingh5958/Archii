from .gemini_service import GeminiService
from ..models.schemas import DesignPlan, StyleType
import logging
import base64
import io

logger = logging.getLogger(__name__)

class ImageService:
    """AI Image Generation for Design Visualizations"""
    
    def __init__(self):
        self.gemini = GeminiService()
    
    def _create_visualization_prompt(self, design_plan: DesignPlan, style: StyleType, room_type: str) -> str:
        """Create detailed prompt for design visualization"""
        
        # Extract key design elements
        furniture_desc = ", ".join([item.get("item", "") for item in design_plan.furniture_placement])
        colors = ", ".join(design_plan.color_palette)
        materials = ", ".join(design_plan.materials_suggestions)
        
        prompt = f"""
        Create a photorealistic interior design visualization of a {room_type} with the following specifications:
        
        STYLE: {style} interior design
        
        FURNITURE PLACEMENT:
        {design_plan.room_layout_strategy}
        
        KEY FURNITURE: {furniture_desc}
        
        COLOR PALETTE: {colors}
        
        MATERIALS: {materials}
        
        LIGHTING: {design_plan.lighting_design}
        
        VISUAL REQUIREMENTS:
        - Photorealistic 3D rendering quality
        - Professional interior photography lighting
        - Show the complete room layout
        - Demonstrate the furniture placement strategy
        - Highlight the color palette and materials
        - Include natural lighting from windows
        - Show depth and spatial relationships
        - High resolution, magazine-quality finish
        
        STYLE DETAILS:
        """
        
        # Add style-specific details
        style_details = {
            "modern": "Clean lines, minimal clutter, neutral colors, sleek furniture, glass and metal accents",
            "traditional": "Classic furniture, warm colors, wood finishes, elegant fabrics, timeless appeal",
            "minimalist": "Extremely clean, white/neutral palette, essential furniture only, maximum negative space",
            "industrial": "Exposed brick, metal fixtures, dark colors, raw materials, urban loft aesthetic",
            "scandinavian": "Light woods, white walls, cozy textures, functional design, hygge atmosphere",
            "bohemian": "Rich colors, mixed patterns, eclectic furniture, plants, artistic elements"
        }
        
        prompt += style_details.get(style, "Contemporary design with clean aesthetics")
        
        return prompt
    
    async def generate_design_visualization(self, design_plan: DesignPlan, style: StyleType, room_type: str) -> str:
        """Generate design visualization image"""
        
        try:
            # Create visualization prompt
            viz_prompt = self._create_visualization_prompt(design_plan, style, room_type)
            
            # Note: Gemini doesn't currently support direct image generation
            # This is a placeholder for when the capability becomes available
            # For now, we'll return a detailed description that could be used with other image generation services
            
            description_prompt = f"""
            Based on this design plan, create a detailed visual description that could be used for image generation:
            
            {viz_prompt}
            
            Provide a comprehensive description of exactly how this room would look, including:
            - Camera angle and perspective
            - Lighting conditions and shadows
            - Texture and material details
            - Color accuracy and saturation
            - Spatial relationships and proportions
            - Atmospheric qualities
            
            Format as a detailed image generation prompt.
            """
            
            detailed_description = await self.gemini.generate_text(description_prompt, "pro")
            
            # Return the detailed description (in production, this would be an actual image URL)
            return f"VISUALIZATION_PROMPT: {detailed_description}"
            
        except Exception as e:
            logger.error(f"Error generating design visualization: {e}")
            return "Unable to generate visualization at this time"
    
    async def generate_architectural_render(self, building_description: str, style: str) -> str:
        """Generate architectural exterior rendering"""
        
        try:
            render_prompt = f"""
            Create a professional architectural rendering of:
            {building_description}
            
            Style: {style}
            
            Requirements:
            - Photorealistic exterior view
            - Professional architectural photography
            - Show building in context with landscaping
            - Accurate proportions and materials
            - Natural lighting conditions
            - High-resolution, presentation quality
            """
            
            # Generate detailed description for architectural rendering
            description = await self.gemini.generate_text(render_prompt, "pro")
            return f"ARCHITECTURAL_RENDER: {description}"
            
        except Exception as e:
            logger.error(f"Error generating architectural render: {e}")
            return "Unable to generate architectural rendering"