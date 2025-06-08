# File: app/routes/__init__.py
def register_routes(app):
    from app.routes.auth import auth_bp
    from app.routes.admin import admin_bp
    from app.routes.passes import passes_bp
    from app.routes.analysis import analysis_bp

    app.register_blueprint(auth_bp)
    app.register_blueprint(admin_bp)
    app.register_blueprint(passes_bp)
    app.register_blueprint(analysis_bp)