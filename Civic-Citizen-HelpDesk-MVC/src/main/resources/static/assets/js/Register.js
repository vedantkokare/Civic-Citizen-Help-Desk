
// Toggle password visibility
function togglePassword(id, btn) {
    const input = document.getElementById(id);
    const icon = btn.querySelector('i');
    
    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.replace('bi-eye', 'bi-eye-slash');
    } else {
        input.type = 'password';
        icon.classList.replace('bi-eye-slash', 'bi-eye');
    }
}

// Check password strength
function checkPasswordStrength(password) {
    const strengthBar = document.getElementById('passwordStrength');
    
    // Count strength points
    let points = 0;
    if (password.length >= 8) points++;
    if (/[A-Z]/.test(password)) points++;
    if (/[a-z]/.test(password)) points++;
    if (/[0-9]/.test(password)) points++;
    if (/[^A-Za-z0-9]/.test(password)) points++;
    
    // Update strength bar
    strengthBar.className = 'password-strength';
    if (points <= 2) {
        strengthBar.classList.add('strength-weak');
    } else if (points <= 4) {
        strengthBar.classList.add('strength-medium');
    } else {
        strengthBar.classList.add('strength-strong');
    }
    
    // Check if passwords match
    checkPasswordMatch();
}

// Check if passwords match
function checkPasswordMatch() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    const matchIndicator = document.getElementById('passwordMatch');
    
    if (!confirmPassword) {
        matchIndicator.innerHTML = '';
        return;
    }
    
    if (password === confirmPassword) {
        matchIndicator.innerHTML = '<small class="text-success"><i class="bi bi-check-circle me-1"></i>Passwords match</small>';
    } else {
        matchIndicator.innerHTML = '<small class="text-danger"><i class="bi bi-x-circle me-1"></i>Passwords do not match</small>';
    }
}

// Track validation status
let validations = {
    email: false,
    mobile: false,
    aadhar: false,
    otp: false
};

// Validate email
async function validateEmail(email) {
    const emailValidation = document.getElementById('emailValidation');
    const emailInput = document.getElementById('email');
    
    // Clear previous messages
    emailValidation.innerHTML = '';
    emailInput.classList.remove('is-valid', 'is-invalid');
    
    if (!email) {
        validations.email = false;
        updateRegisterButton();
        return;
    }
    
    // Check email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        emailValidation.innerHTML = '<span class="validation-error">Please enter valid email</span>';
        emailInput.classList.add('is-invalid');
        validations.email = false;
        updateRegisterButton();
        return;
    }
    
    // Check if email exists
    emailValidation.innerHTML = '<span class="validation-checking">Checking email...</span>';
    
    try {
        const response = await fetch("/checkEmail", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "email=" + encodeURIComponent(email)
        });
        
        const data = await response.json();
        
        if (data.exists) {
            emailValidation.innerHTML = '<span class="validation-error">Email already exists</span>';
            emailInput.classList.add('is-invalid');
            validations.email = false;
        } else {
            emailValidation.innerHTML = '<span class="validation-success">Email available</span>';
            emailInput.classList.add('is-valid');
            validations.email = true;
        }
    } catch (error) {
        emailValidation.innerHTML = '<span class="validation-error">Error checking email</span>';
        emailInput.classList.add('is-invalid');
        validations.email = false;
    }
    
    updateRegisterButton();
}

// Validate mobile number
async function validateMobile(mobile) {
    const mobileValidation = document.getElementById('mobileValidation');
    const mobileInput = document.getElementById('mobile');
    
    mobileValidation.innerHTML = '';
    mobileInput.classList.remove('is-valid', 'is-invalid');
    
    if (!mobile) {
        validations.mobile = false;
        updateRegisterButton();
        return;
    }
    
    // Check length
    if (mobile.length !== 10) {
        mobileValidation.innerHTML = '<span class="validation-error">Must be 10 digits</span>';
        mobileInput.classList.add('is-invalid');
        validations.mobile = false;
        updateRegisterButton();
        return;
    }
    
    // Check if mobile exists
    mobileValidation.innerHTML = '<span class="validation-checking">Checking mobile...</span>';
    
    try {
        const response = await fetch("/checkMobile", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "mobile=" + encodeURIComponent(mobile)
        });
        
        const data = await response.json();
        
        if (data.exists) {
            mobileValidation.innerHTML = '<span class="validation-error">Mobile already registered</span>';
            mobileInput.classList.add('is-invalid');
            validations.mobile = false;
        } else {
            mobileValidation.innerHTML = '<span class="validation-success">Mobile available</span>';
            mobileInput.classList.add('is-valid');
            validations.mobile = true;
        }
    } catch (error) {
        mobileValidation.innerHTML = '<span class="validation-error">Error checking mobile</span>';
        mobileInput.classList.add('is-invalid');
        validations.mobile = false;
    }
    
    updateRegisterButton();
}

// Validate Aadhar number
async function validateAadhar(aadhar) {
    const aadharValidation = document.getElementById('aadharValidation');
    const aadharInput = document.getElementById('aadhar');
    
    aadharValidation.innerHTML = '';
    aadharInput.classList.remove('is-valid', 'is-invalid');
    
    if (!aadhar) {
        validations.aadhar = false;
        updateRegisterButton();
        return;
    }
    
    // Check length
    if (aadhar.length !== 12) {
        aadharValidation.innerHTML = '<span class="validation-error">Must be 12 digits</span>';
        aadharInput.classList.add('is-invalid');
        validations.aadhar = false;
        updateRegisterButton();
        return;
    }
    
    // Check if Aadhar exists
    aadharValidation.innerHTML = '<span class="validation-checking">Checking Aadhar...</span>';
    
    try {
        const response = await fetch("/checkAadhar", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "aadhar=" + encodeURIComponent(aadhar)
        });
        
        const data = await response.json();
        
        if (data.exists) {
            aadharValidation.innerHTML = '<span class="validation-error">Aadhar already registered</span>';
            aadharInput.classList.add('is-invalid');
            validations.aadhar = false;
        } else {
            aadharValidation.innerHTML = '<span class="validation-success">Aadhar available</span>';
            aadharInput.classList.add('is-valid');
            validations.aadhar = true;
        }
    } catch (error) {
        aadharValidation.innerHTML = '<span class="validation-error">Error checking Aadhar</span>';
        aadharInput.classList.add('is-invalid');
        validations.aadhar = false;
    }
    
    updateRegisterButton();
}

// Update register button based on validation status
function updateRegisterButton() {
    const registerBtn = document.getElementById('registerBtn');
    const allValid = validations.email && validations.mobile && validations.aadhar && validations.otp;
    
    if (allValid) {
        registerBtn.disabled = false;
        registerBtn.innerHTML = '<i class="bi bi-person-plus me-2"></i> Create Account';
    } else {
        registerBtn.disabled = true;
        registerBtn.innerHTML = '<i class="bi bi-lock me-2"></i> Complete all validations';
    }
}

// Send OTP
async function sendOTP() {
    const email = document.getElementById("email").value;
    const otpStatus = document.getElementById("otpStatus");
    const sendOtpBtn = document.getElementById("sendOtpBtn");
    
    if (!email) {
        otpStatus.innerText = "Please enter email first";
        otpStatus.className = "otp-status otp-error";
        return;
    }
    
    if (!validations.email) {
        otpStatus.innerText = "Please use a valid email";
        otpStatus.className = "otp-status otp-error";
        return;
    }
    
    // Show loading
    sendOtpBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Sending...';
    sendOtpBtn.disabled = true;
    
    try {
        const response = await fetch("/sendotp", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "email=" + encodeURIComponent(email)
        });
        
        const message = await response.text();
        otpStatus.innerText = message;
        
        if (message.toLowerCase().includes("sent")) {
            otpStatus.className = "otp-status otp-success";
        } else {
            otpStatus.className = "otp-status otp-error";
        }
    } catch (error) {
        otpStatus.innerText = "Error sending OTP";
        otpStatus.className = "otp-status otp-error";
    } finally {
        sendOtpBtn.innerHTML = "Send OTP";
        sendOtpBtn.disabled = false;
    }
}

// Verify OTP
async function verifyOTP() {
    const otp = document.getElementById("emailOtp").value;
    const otpStatus = document.getElementById("otpStatus");
    const verifyOtpBtn = document.getElementById("verifyOtpBtn");
    
    if (!otp) {
        otpStatus.innerText = "Please enter OTP";
        otpStatus.className = "otp-status otp-error";
        return;
    }
    
    // Show loading
    verifyOtpBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Verifying...';
    verifyOtpBtn.disabled = true;
    
    try {
        const response = await fetch("/verifyotp", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "otp=" + encodeURIComponent(otp)
        });
        
        const message = await response.text();
        otpStatus.innerText = message;
        
        if (message.toLowerCase().includes("verified")) {
            otpStatus.className = "otp-status otp-success";
            validations.otp = true;
            // Mark step as completed
            document.querySelectorAll('.step')[2].classList.add('completed');
        } else {
            otpStatus.className = "otp-status otp-error";
            validations.otp = false;
        }
    } catch (error) {
        otpStatus.innerText = "Error verifying OTP";
        otpStatus.className = "otp-status otp-error";
        validations.otp = false;
    } finally {
        verifyOtpBtn.innerHTML = "Verify OTP";
        verifyOtpBtn.disabled = false;
        updateRegisterButton();
    }
}

// Final form validation before submission
function validateForm() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirm-password').value;
    const terms = document.getElementById('terms').checked;
    
    // Check all validations
    if (!validations.email) {
        alert("Please fix email validation");
        return false;
    }
    
    if (!validations.mobile) {
        alert("Please fix mobile validation");
        return false;
    }
    
    if (!validations.aadhar) {
        alert("Please fix Aadhar validation");
        return false;
    }
    
    if (!validations.otp) {
        alert("Please verify OTP");
        return false;
    }
    
    if (password !== confirmPassword) {
        alert("Passwords don't match");
        return false;
    }
    
    if (!terms) {
        alert("Please accept terms and conditions");
        return false;
    }
    
    return true;
}

// Text size adjustment
function adjustTextSize(action) {
    let currentSize = parseFloat(getComputedStyle(document.body).fontSize);
    
    if (action === 'increase') {
        document.body.style.fontSize = (currentSize + 2) + 'px';
    } else if (action === 'decrease') {
        document.body.style.fontSize = (currentSize - 2) + 'px';
    } else {
        document.body.style.fontSize = '16px';
    }
}

// Setup event listeners when page loads
document.addEventListener('DOMContentLoaded', function() {
    // Email validation
    const emailInput = document.getElementById('email');
    emailInput.addEventListener('blur', function() {
        validateEmail(this.value);
    });
    
    // Mobile validation
    const mobileInput = document.getElementById('mobile');
    mobileInput.addEventListener('blur', function() {
        validateMobile(this.value);
    });
    
    // Aadhar validation
    const aadharInput = document.getElementById('aadhar');
    aadharInput.addEventListener('blur', function() {
        validateAadhar(this.value);
    });
    
    // Password confirmation
    const confirmPasswordInput = document.getElementById('confirm-password');
    confirmPasswordInput.addEventListener('input', checkPasswordMatch);
    
    // OTP buttons
    document.getElementById("sendOtpBtn").addEventListener("click", sendOTP);
    document.getElementById("verifyOtpBtn").addEventListener("click", verifyOTP);
    
    // Text size buttons
    document.querySelectorAll('.format-btn').forEach((button, index) => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const actions = ['increase', 'reset', 'decrease'];
            adjustTextSize(actions[index]);
        });
    });
    
    // Initialize button state
    updateRegisterButton();
});