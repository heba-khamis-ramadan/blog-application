# 📝 Blog App – Ruby on Rails

A full-featured blog platform built with **Ruby on Rails**, **PostgreSQL**, **JWT authentication**, **Sidekiq** background jobs, **Redis**, and containerized with **Docker Compose**.

---

## 🚀 Features

- ✅ User authentication using JWT
- 📝 CRUD operations for posts and comments
- 🏷️ Tagging system for posts
- 🕓 Automatic post deletion after 24 hours (via background jobs)
- 🧵 Background job processing with Sidekiq + Redis
- 🐳 Fully containerized using Docker

---

## 📦 Technologies Used

- **Ruby on Rails** 7+
- **PostgreSQL** 15
- **Redis** 7
- **Sidekiq** for background job processing
- **JWT** for user authentication
- **Docker + Docker Compose**

---

## ⚙️ Setup Instructions

### 🔧 Prerequisites

- Docker & Docker Compose installed
- Port `3000` (Rails), `5432` (PostgreSQL), `6379` (Redis) available

---

### 🐳 Run App with Docker

```bash
# Build and start containers
docker-compose up --build

App will be available at: http://localhost:3000
```
---

## 📬 API Overview

### 🔗 Postman Published Documentation 👉 https://documenter.getpostman.com/view/34169826/2sB2jAbTmy

### 💻 Authentication
- **`POST /auth/sign-up`**: Create a new user ✅
- **`POST /auth/login`**: Log in users ✅
### 📝 Post
- **`POST /posts`**: Create a new post ✅
- **`PUT /posts/:post-id`**: Update a user’s post ✅
- **`PATCH /posts/:post-id`**: Update a user’s post tags ✅
- **`DELETE /posts/:post-id`**: Delete a user’s post ✅
- **`GET /posts/:post-id`**: Retrieve post by id ✅
- **`GET /post`s**: Retrieve all a posts ✅
### 💬 Comment
- **`GET /posts/:post-id/comments`**: Retrieve all a user’s post comments ✅
- **`GET /posts/:post-id/comments/:comment-id`**: Retrieve a user’s comment ✅
- **`POST /posts/:post-id/comments/:comment-id`**: Create a new comment ✅
- **`PUT /posts/:post-id/comments/:comment-id`**: Update a user’s comment ✅
- **`DELETE /posts/:post-id/comments/:comment-id`**: Delete a user’s comment ✅

## 📋 License
This project is licensed under the MIT License.