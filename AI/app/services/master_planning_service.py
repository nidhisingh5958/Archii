from .gemini_service import GeminiService
from ..models.schemas import LargeScaleRequest, MasterPlan, ProjectType, ProjectScale
import logging

logger = logging.getLogger(__name__)

class MasterPlanningService:
    """Advanced AI Master Planning for Large-Scale Projects"""
    
    def __init__(self):
        self.gemini = GeminiService()
    
    def _create_master_planning_prompt(self, request: LargeScaleRequest) -> str:
        """Create comprehensive master planning prompt"""
        
        base_prompt = f"""
        You are a world-renowned master planner, urban designer, and architect with expertise in large-scale development projects.
        
        PROJECT BRIEF:
        - Project Type: {request.project_type}
        - Scale: {request.scale}
        - Total Area: {request.area_acres} acres
        - Budget Range: {request.budget_range}
        - Location Type: {request.location_type}
        - Target Capacity: {request.target_capacity or 'Not specified'}
        - Sustainability Level: {request.sustainability_level}
        - Special Requirements: {request.special_requirements or 'None'}
        
        Create a comprehensive master plan with the following JSON structure:
        {{
            "zoning_strategy": "Overall zoning approach and land use distribution",
            "infrastructure_plan": {{
                "roads_network": "Road hierarchy and connectivity",
                "water_supply": "Water infrastructure strategy",
                "sewerage": "Waste management system",
                "electricity": "Power distribution plan",
                "telecommunications": "Digital infrastructure",
                "storm_drainage": "Drainage and flood management"
            }},
            "building_distribution": [
                {{
                    "zone": "zone name",
                    "building_type": "type of buildings",
                    "area_percentage": "% of total area",
                    "capacity": "number of units/people",
                    "height_restrictions": "building height limits",
                    "architectural_style": "recommended style"
                }}
            ],
            "transportation_network": "Comprehensive transportation strategy",
            "utilities_plan": {{
                "power": "Electrical infrastructure",
                "water": "Water supply and treatment",
                "waste": "Waste management",
                "communications": "Telecom and internet"
            }},
            "green_spaces": "Parks, gardens, and environmental areas strategy",
            "sustainability_features": ["list", "of", "sustainable", "features"],
            "construction_phases": [
                {{
                    "phase": "Phase number",
                    "duration_months": "timeline",
                    "components": "what gets built",
                    "investment": "budget allocation"
                }}
            ],
            "cost_estimation": {{
                "infrastructure": "cost range",
                "buildings": "cost range",
                "utilities": "cost range",
                "landscaping": "cost range",
                "total": "total estimated cost"
            }},
            "timeline_months": "total project duration in months",
            "regulatory_compliance": ["list", "of", "regulations", "and", "approvals"]
        }}
        """
        
        # Add project-specific requirements
        if request.project_type == ProjectType.TOWNSHIP:
            base_prompt += self._township_requirements()
        elif request.project_type == ProjectType.UNIVERSITY:
            base_prompt += self._university_requirements()
        elif request.project_type == ProjectType.HOSPITAL:
            base_prompt += self._hospital_requirements()
        elif request.project_type == ProjectType.HOTEL:
            base_prompt += self._hotel_requirements()
        elif request.project_type == ProjectType.RESORT:
            base_prompt += self._resort_requirements()
        elif request.project_type == ProjectType.GOVERNMENT_BUILDING:
            base_prompt += self._government_requirements()
        elif request.project_type == ProjectType.FARMHOUSE:
            base_prompt += self._farmhouse_requirements()
        
        return base_prompt
    
    def _township_requirements(self) -> str:
        return """
        
        TOWNSHIP SPECIFIC REQUIREMENTS:
        - Residential zones (30-40% of area)
        - Commercial areas (10-15% of area)
        - Educational facilities (5-10% of area)
        - Healthcare facilities (2-5% of area)
        - Recreation and parks (20-25% of area)
        - Infrastructure corridors (10-15% of area)
        - Mixed-use developments
        - Community centers and amenities
        - Transportation hubs
        - Emergency services locations
        """
    
    def _university_requirements(self) -> str:
        return """
        
        UNIVERSITY SPECIFIC REQUIREMENTS:
        - Academic buildings and lecture halls (25-30% of area)
        - Student housing and dormitories (20-25% of area)
        - Research facilities and laboratories (15-20% of area)
        - Library and information centers (5-8% of area)
        - Sports and recreation facilities (10-15% of area)
        - Administrative buildings (5-8% of area)
        - Parking and transportation (8-12% of area)
        - Green spaces and courtyards (10-15% of area)
        - Food courts and dining facilities
        - Student activity centers
        """
    
    def _hospital_requirements(self) -> str:
        return """
        
        HOSPITAL SPECIFIC REQUIREMENTS:
        - Patient care areas (40-50% of area)
        - Emergency and trauma centers (10-15% of area)
        - Diagnostic and imaging facilities (8-12% of area)
        - Operating theaters and surgical suites (8-10% of area)
        - Administrative and support areas (10-15% of area)
        - Parking for patients and staff (15-20% of area)
        - Helipad for emergency transport
        - Medical waste management facilities
        - Pharmacy and medical supply storage
        - Staff accommodation areas
        """
    
    def _hotel_requirements(self) -> str:
        return """
        
        HOTEL SPECIFIC REQUIREMENTS:
        - Guest rooms and suites (50-60% of area)
        - Lobby and reception areas (5-8% of area)
        - Restaurants and dining facilities (10-15% of area)
        - Conference and meeting rooms (8-12% of area)
        - Recreation facilities (spa, gym, pool) (10-15% of area)
        - Service areas and back-of-house (8-12% of area)
        - Parking for guests and staff (15-20% of area)
        - Landscaping and outdoor spaces
        - Business center and concierge services
        """
    
    def _resort_requirements(self) -> str:
        return """
        
        RESORT SPECIFIC REQUIREMENTS:
        - Guest accommodations (villas, suites) (30-40% of area)
        - Recreation facilities (pools, sports) (20-25% of area)
        - Dining and entertainment venues (10-15% of area)
        - Spa and wellness centers (8-12% of area)
        - Conference and event spaces (5-8% of area)
        - Landscaping and natural areas (25-35% of area)
        - Staff quarters and service areas (5-10% of area)
        - Adventure and activity zones
        - Beach or waterfront access (if applicable)
        """
    
    def _government_requirements(self) -> str:
        return """
        
        GOVERNMENT BUILDING REQUIREMENTS:
        - Office spaces and administrative areas (40-50% of area)
        - Public service counters and waiting areas (15-20% of area)
        - Meeting rooms and conference facilities (10-15% of area)
        - Security and screening areas (8-12% of area)
        - Archive and document storage (5-8% of area)
        - Parking for staff and visitors (20-25% of area)
        - Ceremonial and public spaces
        - Emergency management centers
        - High-security zones and restricted access areas
        """
    
    def _farmhouse_requirements(self) -> str:
        return """
        
        FARMHOUSE SPECIFIC REQUIREMENTS:
        - Residential living areas (20-30% of area)
        - Agricultural processing facilities (15-25% of area)
        - Livestock housing and barns (20-30% of area)
        - Equipment storage and workshops (10-15% of area)
        - Crop storage and silos (8-12% of area)
        - Farm roads and access paths (5-10% of area)
        - Water management systems (irrigation, ponds)
        - Renewable energy installations (solar, wind)
        - Guest accommodation areas
        - Organic waste processing facilities
        """
    
    async def create_master_plan(self, request: LargeScaleRequest) -> MasterPlan:
        """Generate comprehensive master plan for large-scale projects"""
        
        try:
            # Create master planning prompt
            planning_prompt = self._create_master_planning_prompt(request)
            
            # Generate master plan using Gemini Pro for complex planning
            master_plan_response = await self.gemini.generate_structured_response(planning_prompt, "pro")
            
            # Create and return MasterPlan object
            return MasterPlan(**master_plan_response)
            
        except Exception as e:
            logger.error(f"Error creating master plan: {e}")
            # Return fallback master plan
            return MasterPlan(
                zoning_strategy="Error in master planning generation",
                infrastructure_plan={},
                building_distribution=[],
                transportation_network="Unable to generate transportation plan",
                utilities_plan={},
                green_spaces="Unable to plan green spaces",
                sustainability_features=[],
                construction_phases=[],
                cost_estimation={},
                timeline_months=0,
                regulatory_compliance=[]
            )