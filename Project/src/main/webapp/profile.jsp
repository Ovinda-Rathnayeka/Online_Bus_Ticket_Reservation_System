<!DOCTYPE html>
<html lang="en">
<head>
  <title>Profile</title>
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="css/after-login.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  
  
  <style>
        footer {
            text-align: center;
            padding: 20px;
            background: #0d4875;
            color: #fff;
            bottom: 0;
            width: 100%;
        }
    </style>
  
</head>
<body>

  <div class="sidebar">
    <div class="logo_details">
      <div class="logo_name">User Profile</div>
      <i class="bx bx-menu" id="btn"></i>
    </div>
    <ul class="nav-list">
    
      <li>
        <a href="#" id="dashboard-link">
          <i class="bx bx-grid-alt"></i>
          <span class="link_name">Dashboard</span>
        </a>
        <span class="tooltip">Dashboard</span>
      </li>
      <li>
        <a href="#" id="user-link">
          <i class="bx bx-user"></i>
          <span class="link_name">Update Info</span>
        </a>
        <span class="tooltip">Update Info</span>
      </li>
      <li>
        <a href="#" id="message-link">
           <i class="fa fa-ticket-alt"></i>
          <span class="link_name">My Tickets</span>
        </a>
        <span class="tooltip">My Tickets</span>
      </li>

      <li>
        <a href="#" id="analytics-link">
          <i class="fa fa-money-bill"></i>
          <span class="link_name">Payments</span>
        </a>
        <span class="tooltip">Payments</span>
      </li>
      <!--
      <li>
        <a href="#" id="file-manager-link">
          <i class="bx bx-folder"></i>
          <span class="link_name">File Manager</span>
        </a>
        <span class="tooltip">File Manager</span>
      </li>
      <li>
        <a href="#" id="order-link">
          <i class="bx bx-cart-alt"></i>
          <span class="link_name">Order</span>
        </a>
        <span class="tooltip">Order</span>
      </li>
      <li>
        <a href="#" id="settings-link">
          <i class="bx bx-cog"></i>
          <span class="link_name">Settings</span>
        </a>
        <span class="tooltip">Settings</span>
      </li>
      -->
      <li class="profile">
        <div class="profile_details">
          <div class="profile_content">
            <div class="name">
		      <i class="bx bx-log-out" id="log_out"></i> <!-- Log out icon -->
    </div>
          </div>
        </div>
        <form action="logoutServlet" method="GET" style="display: inline;">
          <button type="submit" style="background: none; border: none; cursor: pointer;">

          </button>
        </form>
      </li>
    </ul>
  </div>

  <section class="home-section">
    <!-- Dashboard Content -->
    <div id="dashboard-content" class="content-area">
      <div class="text"></div>
    </div>
    <!-- User Content -->
    <div id="user-content" class="content-area" style="display:none;">
      <div class="text"></div>
    </div>
    <!-- Message Content -->
    <div id="message-content" class="content-area" style="display:none;">
      <div class="text"></div>
    </div>
    <!-- Payments -->
    <div id="analytics-content" class="content-area" style="display:none;">
      <div class="text"></div>
    </div>
    
    <!--
    <div id="file-manager-content" class="content-area" style="display:none;">
      <div class="text">File Manager</div>
    </div>
    
    <div id="order-content" class="content-area" style="display:none;">
      <div class="text">Order Information</div>
    </div>
    
    <div id="settings-content" class="content-area" style="display:none;">
      <div class="text">Settings Panel</div>
    </div>
    -->
    
  </section>
  
  <footer>
        <p>&copy; 2024 Bus Journey. All rights reserved.</p>
    </footer>

  <script src="script.js"></script>
  
</body>
</html>
