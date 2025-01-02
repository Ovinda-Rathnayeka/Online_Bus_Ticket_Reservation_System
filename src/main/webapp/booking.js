function validateContactNumber() {
    var contactNumberInput = document.getElementById("contact-number").value;
    var contactErrorMessage = document.getElementById("contact-error-message");
    
    // Remove any non-digit characters
    contactNumberInput = contactNumberInput.replace(/\D/g, '');

    if (contactNumberInput.length !== 10) {
        contactErrorMessage.style.display = "block"; // Show error message
    } else {
        contactErrorMessage.style.display = "none"; // Hide error message if valid
    }
}


function validateForm() {
    // Get the values of the from and to fields
    var from = document.getElementById("from").value.trim();
    var to = document.getElementById("to").value.trim();
    var errorMessage = document.getElementById("error-message");

    // Check if the from and to values are the same
    if (from === to) {
        errorMessage.style.display = "block"; // Show the error message
        return false; // Prevent form submission
    } else {
        errorMessage.style.display = "none"; // Hide the error message if valid
    }

    return true; // Allow form submission
}

function changeQuantity(button, change) {
    var input = button.parentElement.querySelector('.quantity-input');
    var currentValue = parseInt(input.value);
    var newValue = currentValue + change;

    if (newValue >= 0) {
        input.value = newValue;
    }
}

function validateQuantity(input) {
    if (isNaN(input.value) || input.value < 0) {
        input.value = 0;
    }
}
