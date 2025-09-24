# CMS Web Application (Laravel Project)

A CMS-based web application built with **Laravel 11**, **Blade**, **TailwindCSS**, **Alpine.js**, and **MySQL**.  
This project was developed as part of **IT7744 Web Technologies – Assignment 3**.

The system allows users to register, log in, create posts with optional images, edit their profiles, and interact with content.  
Administrators have additional privileges through a dedicated **Admin Panel** for managing users and posts.

---

## Features

- **Authentication & Profile Management**  
  - Register, login, logout  
  - Edit profile (username, email, password, avatar)

- **Publishing Section**  
  - Users can create, edit, and delete posts  
  - Optional image upload for posts  

- **Admin Panel**  
  - Accessible only to users with `admin` role  
  - Manage all users and posts  

- **Security & Validation**  
  - CSRF protection on all forms  
  - Client- and server-side sanitization & validation  
  - Role-based access control via middleware and policies  

- **RESTful API**  
  - JSON endpoints for fetching posts  
  - Client-side JS app (`feed.js`) fetches and processes data  

- **JavaScript Test Suite with Playwright**  
  - End-to-end tests for authentication, CRUD posts, and API JSON  

---

## 🛠️ Technologies Used

- **Backend:** Laravel 11, PHP 8+, Eloquent ORM  
- **Frontend:** Blade, TailwindCSS, Alpine.js  
- **Database:** MySQL  
- **Build Tools:** Vite  
- **Version Control:** Git & GitHub  
- **Testing:** Playwright (JavaScript E2E testing)  

---

## 📂 Installation & Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
2. Install dependencies:
   composer install
   npm install
3. Configure environment:
   cp .env.example .env
   php artisan key:generate
   	•	Update .env with your database credentials.
4. Run migrations and seed data:
   php artisan migrate --seed
   Default admin credentials:
	•	Email: admin@example.com
	•	Password: admin
5. Create storage link for images:
   php artisan storage:link
6. Build fronted assets:
   npm run dev
7. Start the server:
   php artisan serve

   Running Tests
Playwright tests
   npx playwright test
  •	tests/auth.spec.js → Registration, login, logout
	•	tests/posts.spec.js → Create post (with image), delete post
	•	tests/api.spec.js → Fetch posts via REST API

---

Submission Checklist

✔️ Client-side JS app fetches & processes REST API JSON
✔️ All forms secured with CSRF
✔️ Client + server-side sanitization & validation
✔️ Best practice coding conventions (PHP, JS, HTML, CSS/SASS)
✔️ Version control with .gitignore
✔️ Playwright test suite covering key functionality
✔️ Secure CMS admin section for CRUD operations
✔️ Secure login & registration with feedback
✔️ Publishing sect

---

Author

Patricia Lara Villegas
Whitecliffe College – Bachelor of Web & Software Development
Course: IT7744 Web Technologies
Assignment 3 (CMS Web Application) – September 2025
