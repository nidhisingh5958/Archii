from fastapi import APIRouter, HTTPException
from ..models.schemas import LargeScaleRequest, LargeScaleResponse, MasterPlan
from ..services import MasterPlanningService, ConstructionPlanningService
import logging

logger = logging.getLogger(__name__)

router = APIRouter()

# Initialize advanced services
master_planning_service = MasterPlanningService()
construction_service = ConstructionPlanningService()

@router.post("/master-plan", response_model=MasterPlan)
async def create_master_plan(request: LargeScaleRequest):
    """Generate comprehensive master plan for large-scale projects"""
    
    try:
        master_plan = await master_planning_service.create_master_plan(request)
        return master_plan
        
    except Exception as e:
        logger.error(f"Error creating master plan: {e}")
        raise HTTPException(status_code=500, detail="Failed to create master plan")

@router.post("/construction-strategy")
async def create_construction_strategy(request: LargeScaleRequest):
    """Generate detailed construction strategy"""
    
    try:
        strategy = await construction_service.create_construction_strategy(request)
        return {"construction_strategy": strategy, "success": True}
        
    except Exception as e:
        logger.error(f"Error creating construction strategy: {e}")
        raise HTTPException(status_code=500, detail="Failed to create construction strategy")

@router.post("/architectural-concepts")
async def generate_architectural_concepts(request: LargeScaleRequest):
    """Generate multiple architectural design concepts"""
    
    try:
        concepts = await construction_service.generate_architectural_concepts(request)
        return {"architectural_concepts": concepts, "success": True}
        
    except Exception as e:
        logger.error(f"Error generating architectural concepts: {e}")
        raise HTTPException(status_code=500, detail="Failed to generate architectural concepts")

@router.post("/environmental-assessment")
async def assess_environmental_impact(request: LargeScaleRequest):
    """Assess environmental impact and sustainability"""
    
    try:
        assessment = await construction_service.assess_environmental_impact(request)
        return {"environmental_impact": assessment, "success": True}
        
    except Exception as e:
        logger.error(f"Error assessing environmental impact: {e}")
        raise HTTPException(status_code=500, detail="Failed to assess environmental impact")

@router.post("/complete-large-scale-planning", response_model=LargeScaleResponse)
async def complete_large_scale_planning(request: LargeScaleRequest):
    """Complete large-scale planning pipeline"""
    
    try:
        # Step 1: Generate master plan
        master_plan = await master_planning_service.create_master_plan(request)
        
        # Step 2: Generate architectural concepts
        architectural_concepts = await construction_service.generate_architectural_concepts(request)
        
        # Step 3: Create construction strategy
        construction_strategy = await construction_service.create_construction_strategy(request)
        
        # Step 4: Assess environmental impact
        environmental_impact = await construction_service.assess_environmental_impact(request)
        
        return LargeScaleResponse(
            master_plan=master_plan,
            architectural_concepts=architectural_concepts,
            construction_strategy=construction_strategy,
            environmental_impact=environmental_impact,
            success=True,
            message="Complete large-scale planning generated successfully"
        )
        
    except Exception as e:
        logger.error(f"Error in complete large-scale planning: {e}")
        raise HTTPException(status_code=500, detail=f"Failed to complete large-scale planning: {str(e)}")

@router.get("/project-types")
async def get_supported_project_types():
    """Get list of supported project types and scales"""
    
    return {
        "project_types": [
            "township", "university", "hospital", "hotel", "resort",
            "government_building", "farmhouse", "commercial_complex",
            "industrial_complex", "sector", "society"
        ],
        "scales": ["room", "building", "complex", "township", "city"],
        "capabilities": [
            "Master planning and zoning",
            "Infrastructure design",
            "Construction strategy",
            "Environmental impact assessment",
            "Architectural concept generation",
            "Sustainability integration",
            "Cost estimation",
            "Timeline planning",
            "Regulatory compliance"
        ]
    }