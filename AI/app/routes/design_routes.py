from fastapi import APIRouter, UploadFile, File, HTTPException, Form
from fastapi.responses import JSONResponse
from ..models.schemas import (
    DesignRequest, DesignPlan, VisionAnalysisResponse, 
    FullDesignResponse, StyleType, BudgetLevel
)
from ..services import VisionService, DesignService, ImageService
import json
import logging

logger = logging.getLogger(__name__)

router = APIRouter()

# Initialize services
vision_service = VisionService()
design_service = DesignService()
image_service = ImageService()

@router.post("/analyze-room", response_model=VisionAnalysisResponse)
async def analyze_room(image: UploadFile = File(...)):
    """Analyze uploaded room image using Gemini vision"""
    
    if not image.content_type.startswith("image/"):
        raise HTTPException(status_code=400, detail="File must be an image")
    
    try:
        # Read image data
        image_data = await image.read()
        
        # Analyze using vision service
        analysis = await vision_service.analyze_room_image(image_data)
        
        return analysis
        
    except Exception as e:
        logger.error(f"Error in room analysis: {e}")
        raise HTTPException(status_code=500, detail="Failed to analyze room image")

@router.post("/design-plan", response_model=DesignPlan)
async def create_design_plan(request: DesignRequest):
    """Generate comprehensive design plan"""
    
    try:
        design_plan = await design_service.create_design_plan(request)
        return design_plan
        
    except Exception as e:
        logger.error(f"Error creating design plan: {e}")
        raise HTTPException(status_code=500, detail="Failed to create design plan")

@router.post("/generate-visual")
async def generate_visualization(
    design_plan: str = Form(...),
    style: StyleType = Form(...),
    room_type: str = Form(...)
):
    """Generate design visualization"""
    
    try:
        # Parse design plan JSON
        plan_data = json.loads(design_plan)
        design_plan_obj = DesignPlan(**plan_data)
        
        # Generate visualization
        visualization = await image_service.generate_design_visualization(
            design_plan_obj, style, room_type
        )
        
        return {"visualization": visualization, "success": True}
        
    except Exception as e:
        logger.error(f"Error generating visualization: {e}")
        raise HTTPException(status_code=500, detail="Failed to generate visualization")

@router.post("/full-design-pipeline", response_model=FullDesignResponse)
async def full_design_pipeline(
    dimensions: str = Form(...),
    style: StyleType = Form(...),
    budget: BudgetLevel = Form(...),
    room_type: str = Form(None),
    special_requirements: str = Form(None),
    image: UploadFile = File(None)
):
    """Complete AI design pipeline - analyze, design, and visualize"""
    
    try:
        # Parse dimensions
        dimensions_dict = json.loads(dimensions)
        
        # Create design request
        design_request = DesignRequest(
            dimensions=dimensions_dict,
            style=style,
            budget=budget,
            room_type=room_type,
            special_requirements=special_requirements
        )
        
        vision_analysis = None
        
        # Step 1: Vision analysis (if image provided)
        if image and image.content_type.startswith("image/"):
            image_data = await image.read()
            vision_analysis = await vision_service.analyze_room_image(image_data)
        
        # Step 2: Generate design plan
        design_plan = await design_service.create_design_plan(design_request, vision_analysis)
        
        # Step 3: Generate layout constraints
        room_type_for_constraints = vision_analysis.room_type if vision_analysis else (room_type or "general")
        constraints = design_service.layout_engine.generate_spatial_constraints(
            dimensions_dict, room_type_for_constraints
        )
        
        # Step 4: Generate visualization
        visualization_url = await image_service.generate_design_visualization(
            design_plan, style, room_type_for_constraints
        )
        
        return FullDesignResponse(
            vision_analysis=vision_analysis,
            design_plan=design_plan,
            layout_constraints=constraints,
            generated_image_url=visualization_url,
            success=True,
            message="Design pipeline completed successfully"
        )
        
    except Exception as e:
        logger.error(f"Error in full design pipeline: {e}")
        return FullDesignResponse(
            vision_analysis=None,
            design_plan=DesignPlan(
                room_layout_strategy="Error occurred",
                furniture_placement=[],
                lighting_design="Error occurred",
                color_palette=[],
                materials_suggestions=[],
                space_optimization="Error occurred",
                budget_breakdown={},
                reasoning="Pipeline failed due to system error"
            ),
            layout_constraints=[],
            generated_image_url=None,
            success=False,
            message=f"Pipeline failed: {str(e)}"
        )

@router.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "healthy", "message": "AI Design Copilot Backend is running"}