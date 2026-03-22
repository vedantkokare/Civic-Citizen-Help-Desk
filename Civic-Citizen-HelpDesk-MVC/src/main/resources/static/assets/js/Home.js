
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