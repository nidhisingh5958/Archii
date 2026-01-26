from .gemini_service import GeminiService
from .layout_engine import LayoutEngine
from ..models.schemas import DesignRequest, DesignPlan, VisionAnalysisResponse
from typing import Optional, List
import logging

logger = logging.getLogger(__name__)

class DesignService:
    """AI Design Brain - Acts as professional architect and interior designer"""
    
    def __init__(self):
        self.gemini = GeminiService()
        self.layout_engine = LayoutEngine()
    
    def _create_design_prompt(self, request: DesignRequest, vision_data: Optional[VisionAnalysisResponse], constraints: List[str]) -> str:
        """Create comprehensive design prompt for Gemini"""
        
        base_prompt = f"""
        You are a certified architect, interior designer, and construction planner with 20+ years of experience.
        
        CLIENT REQUEST:
        - Room Type: {request.room_type or 'Not specified'}
        - Dimensions: {request.dimensions} 
        - Style Preference: {request.style}
        - Budget Level: {request.budget}
        - Special Requirements: {request.special_requirements or 'None'}
        
        SPATIAL CONSTRAINTS:
        {chr(10).join(f"- {constraint}" for constraint in constraints)}
        """
        
        if vision_data:
            base_prompt += f"""
            
            EXISTING ROOM ANALYSIS:
            - Current Room Type: {vision_data.room_type}
            - Wall Colors: {vision_data.wall_colors}
            - Windows: {vision_data.windows}
            - Doors: {vision_data.doors}
            - Existing Furniture: {', '.join(vision_data.existing_furniture)}
            - Lighting: {vision_data.lighting_condition}
            - Available Wall Space: {vision_data.free_space_walls}
            - Structural Limitations: {vision_data.structural_limitations}
            """
        
        design_instructions = f"""
        
        DESIGN TASK:
        Create a comprehensive interior design plan that addresses all spatial constraints and client preferences.
        
        Return your design plan in this exact JSON format:
        {{
            "room_layout_strategy": "Overall approach to space planning and flow",
            "furniture_placement": [
                {{
                    "item": "furniture name",
                    "position": "specific placement description",
                    "reasoning": "why this placement works",
                    "dimensions": {{"length": 0, "width": 0, "height": 0}}
                }}
            ],
            "lighting_design": "Comprehensive lighting strategy including natural and artificial light",
            "color_palette": ["primary_color", "secondary_color", "accent_color"],
            "materials_suggestions": ["material1", "material2", "material3"],
            "space_optimization": "Specific strategies to maximize space efficiency",
            "budget_breakdown": {{
                "furniture": "estimated cost range",
                "lighting": "estimated cost range", 
                "materials": "estimated cost range",
                "total": "total estimated range"
            }},
            "reasoning": "Professional explanation of design decisions and how they meet client needs"
        }}
        
        DESIGN PRINCIPLES TO FOLLOW:
        - Respect all spatial constraints
        - Optimize for the specified budget level
        - Ensure functional flow and accessibility
        - Incorporate the requested style authentically
        - Maximize natural light utilization
        - Create visual balance and harmony
        - Consider maintenance and durability
        
        Budget Guidelines:
        - Low: Focus on essential items, DIY options, budget retailers
        - Medium: Mix of mid-range and budget items, some custom pieces
        - High: Quality furniture, custom elements, premium materials
        - Luxury: High-end designer pieces, custom everything, premium finishes
        """
        
        return base_prompt + design_instructions
    
    async def create_design_plan(self, request: DesignRequest, vision_data: Optional[VisionAnalysisResponse] = None) -> DesignPlan:
        """Generate comprehensive design plan using AI architect brain"""
        
        try:
            # Generate spatial constraints
            room_type = vision_data.room_type if vision_data else (request.room_type or "general")
            constraints = self.layout_engine.generate_spatial_constraints(request.dimensions, room_type)
            
            # Create design prompt
            design_prompt = self._create_design_prompt(request, vision_data, constraints)
            
            # Generate design using Gemini Pro for complex planning
            design_response = await self.gemini.generate_structured_response(design_prompt, "pro")
            
            # Validate and create DesignPlan
            design_plan = DesignPlan(**design_response)
            
            # Additional validation using layout engine
            if design_plan.furniture_placement:
                warnings = self.layout_engine.validate_furniture_placement(
                    design_plan.furniture_placement, 
                    request.dimensions
                )
                if warnings:
                    design_plan.reasoning += f" SPATIAL WARNINGS: {'; '.join(warnings)}"
            
            return design_plan
            
        except Exception as e:
            logger.error(f"Error creating design plan: {e}")
            # Return fallback design plan
            return DesignPlan(
                room_layout_strategy="Unable to generate design plan due to system error",
                furniture_placement=[],
                lighting_design="Standard lighting recommendations",
                color_palette=["neutral", "white", "accent"],
                materials_suggestions=["wood", "fabric", "metal"],
                space_optimization="Basic space optimization principles",
                budget_breakdown={
                    "furniture": "Unable to estimate",
                    "lighting": "Unable to estimate",
                    "materials": "Unable to estimate", 
                    "total": "Please consult with designer"
                },
                reasoning="System error occurred during design generation. Please try again or consult with a professional designer."
            )