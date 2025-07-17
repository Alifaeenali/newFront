document.addEventListener('DOMContentLoaded', function() {
    // Current date tracking
    let currentDate = new Date(2025, 5, 1); // June 2025
    
    // Available dates - in a real app, this would come from an API
    const availableDates = [
        '2025-06-02', '2025-06-03', '2025-06-04', '2025-06-05', '2025-06-06', '2025-06-07',
        '2025-06-08', '2025-06-09', '2025-06-10', '2025-06-11', '2025-06-12', '2025-06-13', '2025-06-14',
        '2025-06-21',
        '2025-06-22', '2025-06-23', '2025-06-24', '2025-06-25', '2025-06-26', '2025-06-27', '2025-06-28',
        '2025-06-29', '2025-06-30'
    ];
    
    let selectedDate = null;
    
    // Initialize calendar
    renderCalendar();
    
    // Event listeners for month navigation
    document.getElementById('prev-month').addEventListener('click', function() {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar();
    });
    
    document.getElementById('next-month').addEventListener('click', function() {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar();
    });
    
    function renderCalendar() {
        const calendarGrid = document.getElementById('calendar-grid');
        calendarGrid.innerHTML = '';
        
        // Set the current month/year display
        document.getElementById('current-month').textContent = 
            `${currentDate.toLocaleString('default', { month: 'long' })} ${currentDate.getFullYear()}`;
        
        // Get first day of month and total days in month
        const firstDay = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
        const lastDay = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
        const daysInMonth = lastDay.getDate();
        
        // Day headers
        const dayNames = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
        dayNames.forEach(day => {
            const dayHeader = document.createElement('div');
            dayHeader.className = 'day-header';
            dayHeader.textContent = day;
            calendarGrid.appendChild(dayHeader);
        });
        
        // Empty cells for days before the first day of the month
        for (let i = 0; i < firstDay.getDay(); i++) {
            const emptyCell = document.createElement('div');
            emptyCell.className = 'day-cell empty';
            calendarGrid.appendChild(emptyCell);
        }
        
        // Days of the month
        for (let day = 1; day <= daysInMonth; day++) {
            const dateStr = `${currentDate.getFullYear()}-${String(currentDate.getMonth() + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`;
            const isAvailable = availableDates.includes(dateStr);
            const isSelected = selectedDate === dateStr;
            
            const dayCell = document.createElement('div');
            dayCell.className = 'day-cell';
            dayCell.textContent = day;
            
            if (isAvailable) {
                if (isSelected) {
                    dayCell.classList.add('selected');
                }
                
                dayCell.addEventListener('click', function() {
                    selectedDate = dateStr;
                    renderCalendar();
                    console.log('Selected date:', dateStr);
                    // In a real app, you would proceed to time selection here
                });
            } else {
                dayCell.classList.add('unavailable');
            }
            
            calendarGrid.appendChild(dayCell);
        }
        
        // Add "No times in June" message on June 15-20
        if (currentDate.getFullYear() === 2025 && currentDate.getMonth() === 5) {
            const noTimesMessage = document.createElement('div');
            noTimesMessage.className = 'no-times';
            noTimesMessage.textContent = 'No times in June';
            noTimesMessage.style.gridColumn = '3 / span 4';
            calendarGrid.appendChild(noTimesMessage);
            
            // Fill empty cells to maintain grid layout
            for (let i = 0; i < 4; i++) {
                const emptyCell = document.createElement('div');
                emptyCell.className = 'day-cell empty';
                calendarGrid.appendChild(emptyCell);
            }
        }
        
        // Add "View next month" option
        const viewNextMonth = document.createElement('div');
        viewNextMonth.className = 'view-next-month';
        viewNextMonth.textContent = 'View next month >';
        viewNextMonth.addEventListener('click', function() {
            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar();
        });
        calendarGrid.appendChild(viewNextMonth);
    }
});

// calender-demo configuration
let toogleBtn = document.querySelector('.next-btn')
let PrevBtn = document.querySelector('.prev-btn')

let demoSection = document.querySelector('.book-appointment')

let calenderSection = document.querySelector('.calender-section')

toogleBtn.addEventListener('click', function(){
    demoSection.style.width = '0%';
        demoSection.style.display = 'none';
        calenderSection.style.width = '60%';
        calenderSection.style.display = 'flex';
})

PrevBtn.addEventListener('click', function(){
    console.log('clicked')
    demoSection.style.width = '60%';
    demoSection.style.display = 'flex';
    calenderSection.style.width = '0%';
    calenderSection.style.display = 'none';
})