window.onload = function() {
    const sidebar = document.querySelector(".sidebar");
    const closeBtn = document.querySelector("#btn");
    const contentAreas = document.querySelectorAll(".content-area");

    // Toggle the sidebar visibility
    closeBtn.addEventListener("click", function() {
        sidebar.classList.toggle("open");
    });

    // Load Dashboard content immediately when the page loads
    loadContent('dashboard-content', 'DisplayUser');

    // Setup click event to load Dashboard content from the DisplayUser servlet
    document.querySelector("#dashboard-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('dashboard-content', 'DisplayUser');
    });

    // Load User content (this is the change you need to make)
    document.querySelector("#user-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('user-content', 'UserFormDisplayServlet');  // Loading content from UserFormDisplayServlet
    });

    // Load Message content (assuming 'MessageDisplayServlet' handles message content)
    document.querySelector("#message-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('message-content', 'displayTickets');  // This should now load messages
    });

    // Load Analytics content
    document.querySelector("#analytics-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('analytics-content', 'AnalyticsServlet');  // Modify the servlet for analytics if necessary
    });

    // Load File Manager content
    document.querySelector("#file-manager-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('file-manager-content', 'FileManagerServlet');  // Modify the servlet for file manager if necessary
    });

    // Load Order content
    document.querySelector("#order-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('order-content', 'OrderDisplayServlet');  // Modify the servlet for orders if necessary
    });

    // Load Settings content
    document.querySelector("#settings-link").addEventListener("click", function(e) {
        e.preventDefault();
        loadContent('settings-content', 'SettingsServlet');  // Modify the servlet for settings if necessary
    });

    // Function to fetch and display content from an external HTML file or servlet
    function loadContent(contentId, url) {
        // Hide all other content areas first
        contentAreas.forEach(content => {
            content.style.display = "none";
        });

        const contentArea = document.getElementById(contentId);
        fetch(url)
            .then(response => response.text())
            .then(html => {
                contentArea.innerHTML = html;
                contentArea.style.display = 'block'; // Make sure the content is visible
            })
            .catch(error => console.error('Error loading the content:', error));
    }
};
