# Helper functions for REST API calls


import requests
import os

API_BASE_URL = "http://127.0.0.1:9115"

def call_api_tollstationpasses(endpoint, params):
    """Make a REST API call."""
    try:
        # Extract parameters for path-based URLs
        station = params.get('station')
        from_date = params.get('from')
        to_date = params.get('to')
        format = params.get('format', 'csv')

        # Format the URL dynamically
        url = f"{API_BASE_URL}{endpoint}/{station}/{from_date}/{to_date}?format={format}"
        
        # Send the GET request
        response = requests.get(url)
        
        # Handle HTTP errors
        if response.status_code == 400:
           print ("Error: Bad request. Please check your parameters.")
        
        response.raise_for_status()

        if format == "json":
            return response.json()  # Parse JSON if requested
        else:
            # Print CSV data instead of saving it
            print(response.text.strip())
            return {"message": "CSV data printed successfully"}
    
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}


def call_api_healthcheck(endpoint):
    """Call the healthcheck API."""
    url = f"{API_BASE_URL}{endpoint}"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}
    
def call_api_admin_addpasses(endpoint, file):
    """Call the admin addpasses API."""
    url = f"{API_BASE_URL}{endpoint}"
    try:
        # Use 'requests' to send a multipart/form-data POST request
        files = {'file': (file.name, file, 'text/csv')}
        response = requests.post(url, files=files)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}


def call_api_passanalysis(endpoint, station_op_id, tag_op_id, date_from, date_to, format_type):
    """Call the passanalysis API."""
    url = f"{API_BASE_URL}{endpoint}/{station_op_id}/{tag_op_id}/{date_from}/{date_to}?format={format_type}"
    try:
        # Make the GET request
        response = requests.get(url)

        # Handle HTTP errors
        if response.status_code == 400:
           print ("Error: Bad request. Please check your parameters.")
           return


        # Return raw CSV if requested; otherwise, parse JSON
        if format_type == 'csv':
            print (response.text)  # CSV content
        return (response.json())  # JSON content
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}



def call_api_admin_usermod(endpoint):
    """Call the admin usermod API."""
    url = f"{API_BASE_URL}{endpoint}"
    try:
        response = requests.post(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}

def call_api_admin_users(endpoint):
    """Call the admin users API."""
    url = f"{API_BASE_URL}{endpoint}"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}

import requests

def call_api_chargesBy(endpoint, params):
    """Call the chargesBy API and print CSV directly if needed."""
    url = f"{API_BASE_URL}{endpoint}"
    try:
        response = requests.get(url, params=params)
        
        response.raise_for_status()

        # Handle HTTP errors
        if response.status_code == 400:
           print ("Error: Bad request. Please check your parameters.")
           return

        # Check if response is empty
        if not response.text.strip():
            return {"error": "API returned an empty response."}

        format_type = params.get("format", "json").lower()

        if format_type == "csv":
            print(response.text)  # Print CSV content directly
            return
        else:
            return response.json()  # Return JSON response

    except requests.exceptions.RequestException as e:
        return {"error": str(e)}
    

def call_api_passesCost(endpoint,params):
    """Call the passes cost API."""
    url = f"{API_BASE_URL}{endpoint}"
    try:  
        # Make the GET request
        response = requests.get(url)  # this implementation is different than the others. It's using the default api
                                      # if the  file name is not good then fix it in the normal api
        # Handle HTTP errors
        if response.status_code == 400:
           print ("Error: Bad request. Please check your parameters.")
           return
        response.raise_for_status()
        format_type = params.get('format_type')
        if format_type == "json":
            return response.json()  # Parse JSON if requested
        else:
            print(response.text)

    except requests.exceptions.RequestException as e:
        return {"error": str(e)}



def call_api_resetpasses(endpoint):
    url = f"{API_BASE_URL}{endpoint}"
    try:
        response = requests.post(url)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        return {"error": str(e)}


def call_api_resetstations(endpoint):
    """Call the resetstations API."""
    try:
        # Construct the URL
        url = f"{API_BASE_URL}{endpoint}"

        # Make the POST request
        response = requests.post(url)
        response.raise_for_status()

        # Return the JSON response
        return response.json()

    except requests.exceptions.RequestException as e:
        return {"error": str(e)}


def call_api_login(endpoint, params):
    """Send a login request to the API."""
    try:
        url = f"{API_BASE_URL}{endpoint}"
        headers = {"Content-Type": "application/x-www-form-urlencoded"}  # Use form-encoded header
        #print(f"Sending POST request to {url} with payload: {params}")  # Debugging print

        # Send form-encoded data using the 'data' parameter
        response = requests.post(url, data=params, headers=headers)
        response.raise_for_status()  # Raise exception for HTTP errors

        return response.json()  # Return the response as JSON
    except requests.exceptions.HTTPError as http_err:
        return {"error": f"HTTP error occurred: {http_err}"}
    except requests.exceptions.RequestException as req_err:
        return {"error": f"Request error occurred: {req_err}"}



def call_api_logout(endpoint, token):
    """Send a logout request to the API."""
    try:
        url = f"{API_BASE_URL}{endpoint}"
        headers = {"X-OBSERVATORY-AUTH": token}

        response = requests.post(url, headers=headers)
        response.raise_for_status()  # Raise exception for HTTP errors

        return {"message": "Logout successful"}
    except requests.exceptions.HTTPError as http_err:
        return {"error": f"HTTP error occurred: {http_err}"}
    except requests.exceptions.RequestException as req_err:
        return {"error": f"Request error occurred: {req_err}"}
