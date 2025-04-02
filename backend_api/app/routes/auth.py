from flask import Blueprint, request, jsonify

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    # Simuler l'auth (à remplacer avec vérification DB)
    if email == "test@example.com" and password == "123456":
        return jsonify({"message": "Connexion réussie", "token": "fake-jwt"}), 200
    else:
        return jsonify({"message": "Identifiants invalides"}), 401
