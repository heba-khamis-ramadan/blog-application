# HLD

## Overview

Building a Blog Application Using Ruby On Rails Framework.

## Requirements

### **Functional Requirements**

1. **User Authentication:**
    - SWR_01: The API shall allow user registration with email, name, password, and image
    - SWR_02: The API shall allow user log in
2. **Post Management:**
    - SWR_03: The API shall allow the user to create a new post
    - SWR_04: The API shall allow the user to update their existing posts
    - SWR_05: The API shall allow the user to update their existing posts tags
    - SWR_06: The API shall allow the user to delete their existing posts
    - SWR_07: The API shall allow the user to retrieve all their posts
    - SWR_08: The API shall allow the user to retrieve all posts
    - SWR_09: Each post must have at least one tag
    - SWR_10: All posts must be deleted after 24 hours of its creation date
3. **Comment Management:**
    - SWR_09: The API shall allow the user to create a new comment on any post
    - SWR_10: The API shall allow the user to update their existing comments
    - SWR_11: The API shall allow the user to delete their existing comments
    - SWR_12: The API shall allow the user to retrieve a post all comments

### System Architecture

**System Architecture Diagram**

- **App Layer:**
    - Handles:
        - User authentication (JWT).
        - CRUD operations for posts and comments.
- **Sidekiq and Redis:**
    - Handles:
        - Scheduled Deletion
- **Database:**
    - Stores:
        - User data
        - Posts
        - Comments

### Database Design

The database will contain the models: Users, Posts, and Comments:

- **User Model**:
    - Fields: `user-id` , `email` , `password` , `name` , `image`, `createdAt` , `updatedAt`
- **Post Model**:
    - Fields: `post_id` ,`user_id(auther)`, `title`, `body`, `tags`, `createdAt` , `updatedAt`
- **Comment Model**:
    - Fields: `comment_id`, `post_id` ,`user_id(commenter)`, `content`, `createdAt` , `updatedAt`

### Modules

- **Authentication**
    - This module handles the authentication of users.
- **Post**
    - This app handles the posts operations.
- **Comment**
    - This app handles the comments operations.

### Interfaces & APIs

- **Authentication**
    - **`POST /auth/sign-up`**: Create a new user 
    - **`POST /auth/log-in`**: Log in users 
- **Post**
    - **`POST /posts`**: Create a new post 
    - **`PUT /posts/{post-id}`**: Update a user’s post 
    - **`PATCH /posts/{post-id}`**: Update a user’s post tags 
    - **`DELETE /posts/{post-id}`**: Delete a user’s post 
    - **`GET /posts/{post-id}`**: Retrieve post by id 
    - **`GET /post`s**: Retrieve all a posts 
- **Comment**
    - **`GET /posts/{post-id}/comments`**: Retrieve all a user’s post comments 
    - **`GET /posts/{post-id}/comments/{comment-id}`**: Retrieve a user’s comment 
    - **`POST /posts/{post-id}/comments/{comment-id}`**: Create a new comment 
    - **`PUT /posts/{post-id}/comments/{comment-id}`**: Update a user’s comment 
    - **`DELETE /posts/{post-id}/comments/{comment-id}`**: Delete a user’s comment 

### Technology Stack

- **Framework:** Ruby On Rails
- **Database:** PostgreSQL
- **Authentication:** JWT
- **Scheduled Jobs:** Sidekiq and redis
- **Containerization:**  docker-compose