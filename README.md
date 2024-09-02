# Client usage instructions

## Prerequisites
1. Create a Project Directory

  Create a new directory for the project and navigate to it:
  
  ```ssh
  mkdir client_project_name
  cd client_project_name 
  ```

2. Create .env File

  Create a file named .env in the project directory and populate it with the required environment variables:

  ```plaintext
  JWT_SECRET=secretPAss1234

#DOCKER
DB_USER=root
DB_PASSWORD=12345
DB_HOST=m37_db
DB_PORT=3306
DB_NAME=m37db
SERVER_PORT=3000
MYSQL_ROOT_PASSWORD=12345
NODE_ENV="production"


CS_CART_API_KEY=ZmFkaUBzaWhheS5jb206NjNaMHo5NDI3U2UxdFY2OTA5SEcyRjMyQ1lTTk1EODg=

  ```
3. In the same directory create a docker-compose.yml and init.sql files

  ```yml
 version: "3.8"

services:
  m37_db:
    env_file:
      - ./.env
    image: mysql:latest
    environment:
      - MYSQL_DATABASE=${DB_NAME}
      - MYSQL_ROOT_HOST=%
      - MYSQL_PASSWORD=${DB_PASSWORD}
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
    ports:
      - "4000:3306"
    volumes:
      - db_data:/var/lib/mysql
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 5

  m37_server:
    image: almtalal/m37:latest
    command: sh -c "sleep 20 && bun run start"
    env_file:
      - ./.env
    depends_on:
      m37_db:
        condition: service_healthy
    ports:
      - "3010:3000"

volumes:
  db_data:


  ```

   ```sql
-- init.sql
CREATE DATABASE IF NOT EXISTS m37db;
USE m37db;

CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

   ```.env
  JWT_SECRET=secretPAss1234

#DOCKER
DB_USER=root
DB_PASSWORD=12345
DB_HOST=m37_db
DB_PORT=3306
DB_NAME=m37db
SERVER_PORT=3000
MYSQL_ROOT_PASSWORD=12345
NODE_ENV="production"


CS_CART_API_KEY=ZmFkaUBzaWhheS5jb206NjNaMHo5NDI3U2UxdFY2OTA5SEcyRjMyQ1lTTk1EODg=

   ```
