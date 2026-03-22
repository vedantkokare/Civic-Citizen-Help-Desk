
// Home page JS //
    // Simple counter animation for statistics
    document.addEventListener('DOMContentLoaded', function() {
      const counters = document.querySelectorAll('.stats-counter');
      const speed = 200;
      
      counters.forEach(counter => {
        const target = parseInt(counter.innerText.replace(/[^0-9]/g, ''));
        let count = 0;
        
        // For percentage values
        if(counter.id === 'satisfactionRate') {
          const increment = target / speed;
          const updateCount = () => {
            count += increment;
            if(count < target) {
              counter.innerText = Math.ceil(count) + '%';
              setTimeout(updateCount, 10);
            } else {
              counter.innerText = target + '%';
            }
          };
          updateCount();
        } 
        // For time values
        else if(counter.id === 'responseTime') {
          counter.innerText = target + 'H';
        }
        // For number values
        else {
          const increment = target / speed;
          const updateCount = () => {
            count += increment;
            if(count < target) {
              counter.innerText = Math.ceil(count).toLocaleString();
              setTimeout(updateCount, 10);
            } else {
              counter.innerText = target.toLocaleString();
            }
          };
          updateCount();
        }
      });
    });
	
	// Home page JS //
	
// ---------------------------------------------------------------------------------------------------- //
	
	// Login Page JS //
	
	  function generateCaptcha() {
	    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
	    let captcha = '';
	    for (let i = 0; i < 6; i++) {
	      captcha += chars.charAt(Math.floor(Math.random() * chars.length));
	    }
	    return captcha;
	  }

	  const captchaSpan = document.getElementById('captcha-value');
	  const captchaHidden = document.getElementById('captcha-hidden');
	  const refreshBtn = document.getElementById('refresh-captcha');

	  function setCaptcha() {
	    const captcha = generateCaptcha();
	    captchaSpan.textContent = captcha;
	    captchaHidden.value = captcha;
	  }

	  refreshBtn.addEventListener('click', setCaptcha);
	  document.addEventListener('DOMContentLoaded', setCaptcha);

	  // Text size adjustment
	  document.querySelectorAll('.format-btn').forEach((button, index) => {
	    button.addEventListener('click', function(e) {
	      e.preventDefault();
	      let currentSize = parseFloat(getComputedStyle(document.body).fontSize);
	      
	      if (index === 0) { // Increase
	        document.body.style.fontSize = (currentSize + 2) + 'px';
	      } else if (index === 1) { // Reset
	        document.body.style.fontSize = '16px';
	      } else if (index === 2) { // Decrease
	        document.body.style.fontSize = (currentSize - 2) + 'px';
	      }
	    });
	  });

	// Login Page JS //
	
// ------------------------------------------------------------------------------------------------------------------ //