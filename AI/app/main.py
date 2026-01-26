from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from dotenv import load_dotenv
import os
import logging

# Load environment variables
load_dotenv()

# Import routes and utilities
from .routes import design_router, advanced_router
from .utils import setup_logging

# Setup logging
setup_logging(level="INFO")
logger = logging.getLogger(__name__)

# Create FastAPI app
app = FastAPI(
    title="AI Architectural Design Copilot",
    description="AI-Powered Backend for Architectural, Interior Design, and Construction Planning",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# CORS middleware for Flutter app
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Configure appropriately for production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routers
app.include_router(design_router, prefix="/api/v1", tags=["Design"])
app.include_router(advanced_router, prefix="/api/v1", tags=["Advanced Planning"])

@app.on_event("startup")
async def startup_event():
    """Application startup event"""
    logger.info("🚀 AI Architectural Design Copilot Backend Starting...")
    
    # Verify Gemini API key
    api_key = os.getenv("GEMINI_API_KEY")
    if not api_key:
        logger.error("❌ GEMINI_API_KEY not found in environment variables")
        raise RuntimeError("GEMINI_API_KEY is required")
    
    logger.info("✅ Gemini API key configured")
    logger.info("✅ All services initialized")
    logger.info("🎯 AI Design Copilot Backend is ready!")

@app.on_event("shutdown")
async def shutdown_event():
    """Application shutdown event"""
    logger.info("🛑 AI Design Copilot Backend shutting down...")

@app.exception_handler(Exception)
async def global_exception_handler(request, exc):
    """Global exception handler"""
    logger.error(f"Unhandled exception: {exc}")
    return JSONResponse(
        status_code=500,
        content={"detail": "Internal server error occurred"}
    )

@app.get("/")
async def root():
    """Root endpoint"""
    return {
        "message": "AI Architectural Design Copilot Backend",
        "version": "1.0.0",
        "status": "running",
        "endpoints": {
            "analyze_room": "/api/v1/analyze-room",
            "design_plan": "/api/v1/design-plan", 
            "generate_visual": "/api/v1/generate-visual",
            "full_pipeline": "/api/v1/full-design-pipeline",
            "master_plan": "/api/v1/master-plan",
            "construction_strategy": "/api/v1/construction-strategy",
            "architectural_concepts": "/api/v1/architectural-concepts",
            "environmental_assessment": "/api/v1/environmental-assessment",
            "complete_large_scale": "/api/v1/complete-large-scale-planning"
        }
    }

@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy",
        "service": "AI Design Copilot Backend",
        "gemini_configured": bool(os.getenv("GEMINI_API_KEY"))
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )