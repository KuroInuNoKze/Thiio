# FrontEnd (Vuetify + Vite)
Inside the file /vite.config.mjs are all the configuration parameters necesary for the correct start of the frontend
In the .env file that can be found in the root of the frontend folder you can set the url of the endpoit that is going to be feeding the FrontEnd as for the url of the publi resources and Storage
VITE_TITLE=My App
VITE_VERSION=0.1
VITE__API_URL=http://localhost:8000/api
VITE__RES_URL=http://localhost:8000/
VITE__RES_PROFILE_URL=http://localhost:8000/storage/profile/

Requierement:
Node js
Npm

| Requierements:                               |    Official Page      |
|---------------------------------------------------------|-----------------------|
| Node JS and Npm                                         | (https://nodejs.org/) |

After completing the installation of these two, go to the root of the Project Folder folder.

| Run in the console:                                           |     Command    |
|---------------------------------------------------------------|----------------|
| Run at the root of the project forlder                        | `cd/frontend/` |
| Install all the dependencies                                  | `npm install`  |
| Run the frontend                                              | `npm run dev`  |

After completing the installation, the front end is ready to be observed and tested as soon as the backend is ready too.


Frameworks and Modules
- Vuex Store -> For keepeng the User auth data in an easy access place. (Pinia) 
- Vue Router -> For routing, and keep the instruders out with his Navigation Guards... and routing.

Notes:
<<<<<<< HEAD
- Since its not a big project it there only one Custom Component thet i needed "NotificationDialog.vue", it's only functionlity is to notify about the actions that are been held between the fontend and the Endpoint API.
=======
- Since its not a big project it there only one Custom Component thet i needed "NotificationDialog.vue", it's only functionlity is to notify about the accions that are been held between the fontend and the Endpoint API.
>>>>>>> 61fdc0c (Readme 1)
- All pages except login,  are wrapped by a layout "AdminLayout" and cant be accesed without been logged in.
- At src/assets/js there a small module for handle the axios Promise errors and establish the tittle and message for the dialog that is going to deliver the notification to the user.

# BackEnd (Laravel 10)

Requierement:
- PHP

First set up the DB for the backend. You can choose any driver desired.
All needed configurations can be found in (https://laravel.com/docs/10.x/configuration#environment-configuration)
but you dont need to, just get the password to the Data Base in the .env file and thats it.

To start with a new set of data
<<<<<<< HEAD
| Run in the console:                                        |        Command         |
|------------------------------------------------------------|------------------------|
| Run migrations so the tables can be iserted into the DB    | `php artisian migrate` |
| Run the seed function to populate the table Users          | `php artisian db:seed` |
| Run the backend                                            | `php artisian serve`   |

To start with previus set of data download the DB backup in the folder of the project, and restore it to a DB named "thiio_app" or change the name in the .env file in the backed folder root. Just fin the line that contains "DB_DATABASE="
Requierement:
- MySql

Now once restored the DB and configured the .env file. We are ready.

| RunRun in the console:                                    |        Command         |
|-----------------------------------------------------------|------------------------|
| Run the backend                                           |  `php artisian serve`  |


There are a few endpoint on this projects:

| Run in the console:                                           |     Objective        |
|---------------------------------------------------------------|----------------------|
| http://localhost:8000/apilogin/                               |        Login         |
| http://localhost:8000/api/authenticated/                      | Check Authentication |
| http://localhost:8000/api/users/                              |   Get Current User   |
| http://localhost:8000/api/users/logout                        |        Log Out       |
| http://localhost:8000/api/users/users                         |    Get All  Users    |
| http://localhost:8000/api/users/create                        |     Add New User     |
| http://localhost:8000/api/users/{id}                          |     Get One User     |
| http://localhost:8000/api/users/{id}                          |    Update One User   |
| http://localhost:8000/api/users/update-password/{id}          |   Update User Pass   |
| http://localhost:8000/api/users/update-picture/{id}           |   Upd. User Picture  |
| http://localhost:8000/api/users/{id}                          |     Remove an User   |


I follow architecture MVVM architecture for Vue and the Laravel backend offers a service-oriented architecture.
Available test can be run by the command in the console  "php artisan test" or "vendor/bin/phpunit"
For the Unit Testing, most of the time I just apply the Red-Green-Refactor.

=======
| Run in the console:                                           |     Command    |
|---------------------------------------------------------------|----------------|
| Run migrations so the tables can be iserted into the DB       | `php artisian migrate` |
| Run the seed function to populate the table Users             | `php artisian db:seed` |
| Run the backend                                               | `php artisian serve`   |

To start with previus set of data download the DB backup in the folder of the project, and restore it to a DB named "thiio_app" or change the name in the .env file in the backed folder root. Just fin the line that contains "DB_DATABASE="
Requierement:
- MySql

Now once restored the DB and configured the .env file. We are ready.

| Run in the console:                                           |     Command    |
|---------------------------------------------------------------|----------------|
| Run the backend                                               | `php artisian serve`   |
To test with Postman:


>>>>>>> 61fdc0c (Readme 1)
