from typing import Dict, List, Tuple
import logging
from ..models.schemas import ProjectType, ProjectScale

logger = logging.getLogger(__name__)

class LayoutEngine:
    """Rule-based spatial reasoning for interior design constraints and large-scale planning"""
    
    def __init__(self):
        # Minimum clearance requirements (in feet)
        self.clearance_rules = {
            "bed": 2.0,
            "desk": 2.5,
            "sofa": 3.0,
            "dining_table": 3.0,
            "wardrobe": 2.0,
            "kitchen_counter": 3.5,
            "bathroom_fixtures": 2.0
        }
        
        # Optimal placement rules
        self.placement_rules = {
            "desk": "near_window",
            "bed": "away_from_door",
            "sofa": "facing_focal_point",
            "dining_table": "center_room",
            "wardrobe": "against_wall"
        }
        
        # Large-scale planning ratios
        self.large_scale_ratios = {
            ProjectType.TOWNSHIP: {
                "residential": 0.35,
                "commercial": 0.12,
                "educational": 0.08,
                "healthcare": 0.04,
                "recreation": 0.22,
                "infrastructure": 0.19
            },
            ProjectType.UNIVERSITY: {
                "academic": 0.28,
                "housing": 0.23,
                "research": 0.18,
                "library": 0.07,
                "sports": 0.13,
                "administration": 0.06,
                "parking": 0.05
            },
            ProjectType.HOSPITAL: {
                "patient_care": 0.45,
                "emergency": 0.12,
                "diagnostics": 0.10,
                "surgery": 0.09,
                "administration": 0.12,
                "parking": 0.12
            }
        }
    
    def calculate_room_area(self, dimensions: Dict[str, float]) -> float:
        """Calculate total room area"""
        return dimensions.get("length", 0) * dimensions.get("width", 0)
    
    def get_room_category(self, area: float) -> str:
        """Categorize room size"""
        if area < 80:
            return "small"
        elif area < 150:
            return "medium"
        else:
            return "large"
    
    def generate_spatial_constraints(self, dimensions: Dict[str, float], room_type: str) -> List[str]:
        """Generate spatial layout constraints based on room dimensions and type"""
        
        constraints = []
        area = self.calculate_room_area(dimensions)
        room_category = self.get_room_category(area)
        length = dimensions.get("length", 0)
        width = dimensions.get("width", 0)
        
        # Basic area constraints
        constraints.append(f"Room area: {area} sq ft ({room_category} room)")
        
        # Room-specific constraints
        if room_type == "bedroom":
            constraints.extend(self._bedroom_constraints(length, width, room_category))
        elif room_type == "living_room":
            constraints.extend(self._living_room_constraints(length, width, room_category))
        elif room_type == "kitchen":
            constraints.extend(self._kitchen_constraints(length, width, room_category))
        elif room_type == "office":
            constraints.extend(self._office_constraints(length, width, room_category))
        
        # General constraints
        constraints.extend(self._general_constraints(length, width))
        
        return constraints
    
    def _bedroom_constraints(self, length: float, width: float, category: str) -> List[str]:
        """Bedroom-specific spatial constraints"""
        constraints = []
        
        if category == "small":
            constraints.append("Use space-saving furniture (loft bed, wall-mounted desk)")
            constraints.append("Minimize furniture count to avoid overcrowding")
        
        constraints.extend([
            "Bed requires 2ft clearance on at least one side",
            "Wardrobe should not block windows or natural light",
            "Maintain clear walking path from door to bed",
            "Position bed away from direct door alignment for privacy"
        ])
        
        return constraints
    
    def _living_room_constraints(self, length: float, width: float, category: str) -> List[str]:
        """Living room spatial constraints"""
        constraints = []
        
        constraints.extend([
            "Sofa placement should create conversation area",
            "Maintain 3ft clearance around seating",
            "TV viewing distance: 8-12ft from seating",
            "Create clear traffic flow paths"
        ])
        
        if category == "small":
            constraints.append("Use multi-functional furniture (ottoman with storage)")
        
        return constraints
    
    def _kitchen_constraints(self, length: float, width: float, category: str) -> List[str]:
        """Kitchen spatial constraints"""
        return [
            "Work triangle: sink, stove, refrigerator within 4-9ft of each other",
            "Minimum 3.5ft clearance for kitchen walkways",
            "Counter space: minimum 2ft on each side of sink",
            "Avoid placing refrigerator next to stove"
        ]
    
    def _office_constraints(self, length: float, width: float, category: str) -> List[str]:
        """Office spatial constraints"""
        return [
            "Desk should be positioned near natural light source",
            "Maintain 2.5ft clearance behind desk chair",
            "Monitor should be perpendicular to windows to avoid glare",
            "Storage should be within arm's reach of desk"
        ]
    
    def _general_constraints(self, length: float, width: float) -> List[str]:
        """General spatial constraints for any room"""
        constraints = []
        
        # Proportion-based constraints
        if length / width > 2.5:
            constraints.append("Long narrow room: use furniture to create zones")
        
        if min(length, width) < 8:
            constraints.append("Narrow dimension: avoid bulky furniture on short walls")
        
        constraints.extend([
            "Maintain minimum 2ft walking paths",
            "Leave 6-12 inches between furniture and walls",
            "Ensure door swing clearance is not obstructed"
        ])
        
        return constraints
    
    def validate_furniture_placement(self, furniture_list: List[Dict], dimensions: Dict[str, float]) -> List[str]:
        """Validate if proposed furniture fits within spatial constraints"""
        warnings = []
        total_furniture_area = 0
        
        for item in furniture_list:
            if "dimensions" in item:
                item_area = item["dimensions"].get("length", 0) * item["dimensions"].get("width", 0)
                total_furniture_area += item_area
        
        room_area = self.calculate_room_area(dimensions)
        furniture_ratio = total_furniture_area / room_area if room_area > 0 else 0
        
        if furniture_ratio > 0.6:
            warnings.append("Furniture may overcrowd the space (>60% of floor area)")
        
        return warnings
    
    def generate_large_scale_constraints(self, project_type: ProjectType, area_acres: float) -> List[str]:
        """Generate constraints for large-scale projects"""
        
        constraints = []
        area_sq_ft = area_acres * 43560  # Convert acres to square feet
        
        if project_type in self.large_scale_ratios:
            ratios = self.large_scale_ratios[project_type]
            
            for zone, ratio in ratios.items():
                zone_area = area_sq_ft * ratio
                zone_acres = zone_area / 43560
                constraints.append(f"{zone.replace('_', ' ').title()}: {zone_acres:.1f} acres ({ratio*100:.0f}% of total area)")
        
        # Add project-specific constraints
        if project_type == ProjectType.TOWNSHIP:
            constraints.extend(self._township_constraints(area_acres))
        elif project_type == ProjectType.UNIVERSITY:
            constraints.extend(self._university_constraints(area_acres))
        elif project_type == ProjectType.HOSPITAL:
            constraints.extend(self._hospital_constraints(area_acres))
        
        return constraints
    
    def _township_constraints(self, area_acres: float) -> List[str]:
        """Township-specific planning constraints"""
        return [
            "Minimum 20% green space and parks required",
            "Road network should not exceed 15% of total area",
            "Mixed-use development encouraged in commercial zones",
            "Minimum 500ft buffer between industrial and residential areas",
            "Emergency services within 5-minute response time",
            "Public transportation connectivity required"
        ]
    
    def _university_constraints(self, area_acres: float) -> List[str]:
        """University-specific planning constraints"""
        return [
            "Academic buildings should be centrally located",
            "Student housing within 10-minute walk of academic core",
            "Parking should not dominate campus landscape",
            "Green corridors connecting major buildings",
            "Research facilities may require special utilities",
            "Campus should support 15,000-20,000 daily population"
        ]
    
    def _hospital_constraints(self, area_acres: float) -> List[str]:
        """Hospital-specific planning constraints"""
        return [
            "Emergency access must be separate from main entrance",
            "Helipad required for trauma center designation",
            "Medical waste handling facilities required",
            "Backup power systems for critical areas",
            "Parking for 3-4 vehicles per bed",
            "Future expansion capability of 25% required"
        ]