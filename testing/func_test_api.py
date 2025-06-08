import requests
import json

API_BASE_URL = "http://127.0.0.1:9115"

# Global Variables
TOKEN = None


def test_login():
    """Test the login endpoint."""
    global TOKEN
    print("🔍 Testing login...")

    payload = {"username": "admin", "password": "admin"}  # Change if needed
    response = requests.post(f"{API_BASE_URL}/login", data=payload)

    assert response.status_code == 200, f"❌ Login failed. Response: {response.text}"
    data = response.json()
    
    assert "token" in data, "❌ Token not received in login response."
    TOKEN = data["token"]
    
    print("✅ Login test passed.")


def test_healthcheck():
    """Test the healthcheck API."""
    print("🔍 Testing healthcheck...")
    
    response = requests.get(f"{API_BASE_URL}/api/admin/healthcheck")
    
    assert response.status_code == 200, f"❌ Healthcheck failed. Response: {response.text}"
    data = response.json()
    
    assert data.get("status") == "OK", "❌ Healthcheck did not return OK status."
    print("✅ Healthcheck test passed.")


def test_tollstationpasses():
    """Test the tollStationPasses API."""
    print("🔍 Testing tollStationPasses...")

    station_id = "NO01"
    date_from = "20220101"
    date_to = "20220131"
    
    response = requests.get(f"{API_BASE_URL}/api/tollStationPasses/{station_id}/{date_from}/{date_to}?format=json")
    
    assert response.status_code == 200, f"❌ TollStationPasses test failed. Response: {response.text}"
    data = response.json()
    
    assert "stationID" in data, "❌ Missing 'stationID' in response."
    assert "passList" in data, "❌ No 'passList' in response."
    
    print("✅ TollStationPasses test passed.")


def test_passanalysis():
    """Test the passAnalysis API."""
    print("🔍 Testing passAnalysis...")

    station_op = "NO"
    tag_op = "NAO"
    date_from = "20220101"
    date_to = "20220131"
    
    response = requests.get(f"{API_BASE_URL}/api/passAnalysis/{station_op}/{tag_op}/{date_from}/{date_to}?format=json")
    
    assert response.status_code == 200, f"❌ PassAnalysis test failed. Response: {response.text}"
    data = response.json()
    
    assert "stationOpID" in data, "❌ Missing 'stationOpID' in response."
    assert "passList" in data, "❌ No 'passList' in response."
    
    print("✅ PassAnalysis test passed.")


def test_admin_resetpasses():
    """Test resetting passes (Admin only)."""
    print("🔍 Testing resetpasses...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}

    response = requests.post(f"{API_BASE_URL}/api/admin/resetpasses", headers=headers)

    assert response.status_code == 200, f"❌ ResetPasses test failed. Response: {response.text}"
    data = response.json()
    
    assert data.get("status") == "OK", "❌ ResetPasses did not return OK status."
    
    print("✅ ResetPasses test passed.")





def test_chargesby():
    """Test the chargesBy API."""
    print("🔍 Testing chargesBy...")

    op_id = "NAO"
    date_from = "20220101"
    date_to = "20220131"
    
    response = requests.get(f"{API_BASE_URL}/api/chargesBy/{op_id}/{date_from}/{date_to}?format=json")
    
    assert response.status_code == 200, f"❌ ChargesBy test failed. Response: {response.text}"
    data = response.json()
    
    assert "tollOpID" in data, "❌ Missing 'tollOpID' in response."
    assert "vOpList" in data, "❌ No 'vOpList' in response."
    
    print("✅ ChargesBy test passed.")


def test_admin_resetstations():
    """Test resetting toll stations (Admin only)."""
    print("🔍 Testing resetstations...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}

    response = requests.post(f"{API_BASE_URL}/api/admin/resetstations", headers=headers)

    assert response.status_code == 200, f"❌ ResetStations test failed. Response: {response.text}"
    data = response.json()
    
    assert data.get("status") == "OK", "❌ ResetStations did not return OK status."
    
    print("✅ ResetStations test passed.")


def test_logout():
    """Test the logout endpoint."""
    global TOKEN
    print("🔍 Testing logout...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}
    
    response = requests.post(f"{API_BASE_URL}/logout", headers=headers)
    
    assert response.status_code == 200, f"❌ Logout failed. Response: {response.text}"
    
    TOKEN = None  # Clear token after logout
    
    print("✅ Logout test passed.")

def test_passescost():
    """Test the passescost API call."""
    print("🔍 Testing passescost...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}

    params = {
        "format": "json"
    }

    response = requests.get(f"{API_BASE_URL}/api/passesCost/NAO/NO/20220101/20220131", headers=headers, params=params)

    assert response.status_code == 200, f"❌ PassesCost test failed. Response: {response.text}"
    data = response.json()

    assert "tollOpID" in data, "❌ PassesCost response missing tollOpID."
    assert "tagOpID" in data, "❌ PassesCost response missing tagOpID."
    assert "passesCost" in data, "❌ PassesCost response missing passesCost."

    print("✅ PassesCost test passed.")

def test_admin_usermod():
    """Test modifying a user's password."""
    print("🔍 Testing usermod...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}

    response = requests.post(f"{API_BASE_URL}/api/admin/usermod/testuser/newpassword", headers=headers)

    assert response.status_code == 200, f"❌ Usermod test failed. Response: {response.text}"
    data = response.json()

    assert data.get("status") == "success", "❌ Usermod did not return success status."

    print("✅ Usermod test passed.")

def test_admin_users():
    """Test retrieving all users."""
    print("🔍 Testing admin --users...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}

    response = requests.get(f"{API_BASE_URL}/api/admin/users", headers=headers)

    assert response.status_code == 200, f"❌ Admin users test failed. Response: {response.text}"
    data = response.json()

    assert "users" in data, "❌ Users list not returned."
    
    print("✅ Admin users test passed.")

def test_admin_addpasses():
    """Test adding passes using a CSV file."""
    print("🔍 Testing admin --addpasses...")

    headers = {"X-OBSERVATORY-AUTH": TOKEN} if TOKEN else {}

    files = {
        "file": ("toll_data.csv", open("toll_data.csv", "rb"), "text/csv")
    }

    response = requests.post(f"{API_BASE_URL}/api/admin/addpasses", headers=headers, files=files)

    assert response.status_code == 200, f"❌ AddPasses test failed. Response: {response.text}"
    data = response.json()

    assert data.get("status") == "success", "❌ AddPasses did not return success status."

    print("✅ AddPasses test passed.")



def run_all_tests():
    """Run all tests sequentially."""
    print("\n🚀 Starting API Tests...\n")
    
    test_login()
    test_healthcheck()
    test_tollstationpasses()
    test_passanalysis()
    test_chargesby()
    test_admin_resetstations()
    test_admin_resetpasses()
    test_passescost()  
    test_admin_usermod()  
    test_admin_users() 
    test_admin_addpasses()
    test_logout()
    
    print("\n✅ All API tests completed successfully!")


if __name__ == "__main__":
    run_all_tests()
