from pydantic import BaseModel
from typing import List, Optional, Dict, Any
from enum import Enum

class StyleType(str, Enum):
    MODERN = "modern"
    TRADITIONAL = "traditional"
    MINIMALIST = "minimalist"
    INDUSTRIAL = "industrial"
    SCANDINAVIAN = "scandinavian"
    BOHEMIAN = "bohemian"

class BudgetLevel(str, Enum):
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    LUXURY = "luxury"

class RoomType(str, Enum):
    BEDROOM = "bedroom"
    LIVING_ROOM = "living_room"
    KITCHEN = "kitchen"
    BATHROOM = "bathroom"
    OFFICE = "office"
    DINING_ROOM = "dining_room"

class ProjectScale(str, Enum):
    ROOM = "room"
    BUILDING = "building"
    COMPLEX = "complex"
    TOWNSHIP = "township"
    CITY = "city"

class ProjectType(str, Enum):
    RESIDENTIAL_ROOM = "residential_room"
    RESIDENTIAL_BUILDING = "residential_building"
    TOWNSHIP = "township"
    UNIVERSITY = "university"
    HOSPITAL = "hospital"
    HOTEL = "hotel"
    RESORT = "resort"
    GOVERNMENT_BUILDING = "government_building"
    FARMHOUSE = "farmhouse"
    COMMERCIAL_COMPLEX = "commercial_complex"
    INDUSTRIAL_COMPLEX = "industrial_complex"
    SECTOR = "sector"
    SOCIETY = "society"

class VisionAnalysisResponse(BaseModel):
    room_type: str
    wall_colors: str
    windows: str
    doors: str
    existing_furniture: List[str]
    lighting_condition: str
    free_space_walls: str
    structural_limitations: str

class DesignRequest(BaseModel):
    dimensions: Dict[str, float]  # {"length": 12, "width": 10, "height": 9}
    style: StyleType
    budget: BudgetLevel
    room_type: Optional[RoomType] = None
    special_requirements: Optional[str] = None

class DesignPlan(BaseModel):
    room_layout_strategy: str
    furniture_placement: List[Dict[str, Any]]
    lighting_design: str
    color_palette: List[str]
    materials_suggestions: List[str]
    space_optimization: str
    budget_breakdown: Dict[str, str]
    reasoning: str

class LargeScaleRequest(BaseModel):
    project_type: ProjectType
    scale: ProjectScale
    area_acres: float
    budget_range: str  # "10M-50M", "50M-100M", "100M+"
    location_type: str  # "urban", "suburban", "rural"
    special_requirements: Optional[str] = None
    sustainability_level: Optional[str] = "medium"  # "low", "medium", "high"
    target_capacity: Optional[int] = None  # people/units

class MasterPlan(BaseModel):
    zoning_strategy: str
    infrastructure_plan: Dict[str, Any]
    building_distribution: List[Dict[str, Any]]
    transportation_network: str
    utilities_plan: Dict[str, str]
    green_spaces: str
    sustainability_features: List[str]
    construction_phases: List[Dict[str, Any]]
    cost_estimation: Dict[str, str]
    timeline_months: int
    regulatory_compliance: List[str]

class FullDesignResponse(BaseModel):
    vision_analysis: Optional[VisionAnalysisResponse]
    design_plan: DesignPlan
    layout_constraints: List[str]
    generated_image_url: Optional[str]
    success: bool
    message: str

class LargeScaleResponse(BaseModel):
    master_plan: MasterPlan
    architectural_concepts: List[Dict[str, Any]]
    construction_strategy: Dict[str, Any]
    environmental_impact: Dict[str, str]
    success: bool
    message: str