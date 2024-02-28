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

| Run in the console:                                     |    Official Page      |
|---------------------------------------------------------|-----------------------|
| Node JS and Npm                                         | (https://nodejs.org/) |

After completing the installation of these two, go to the root of the Project Folder folder.

| Run in the console:                                           |     Command    |
|---------------------------------------------------------------|----------------|
| Run at the root of the project forlder                        | `cd/frontend/` |
| Install all the dependencies                                  | `npm install`  |
| Run the frontend                                              | `npm run dev`  |

After completing the installation, the front end is ready to be observed and tested.

| Package Manager                                                | Command        |
|---------------------------------------------------------------|----------------|
| [yarn](https://yarnpkg.com/getting-started)                   | `yarn install` |
| [npm](https://docs.npmjs.com/cli/v7/commands/npm-install)     | `npm install`  |
| [pnpm](https://pnpm.io/installation)                          | `pnpm install` |
| [bun](https://bun.sh/#getting-started)                        | `bun install`  |

Frameworks and Modules
- Vuex Store -> For keepeng the User auth data in an easy access place. (Pinia) 
- Vue Router -> For routing, and keep the instruders out with his Navigation Guards... and routing.

Notes:
- Since its not a big project it there only one Custom Component thet i needed "NotificationDialog.vue", it's only functionlity is to notify about the accions that are been held between the fontend and the Endpoint API.
- All pages except login  are wrapped by a layout "AdminLayout" and cant be accesed withoun been logged in.
- At src/assets/js there a small module for handle the axios Promise errors and establish the tittle and message for the dialog that is going to deliver the notification to the user.

# BackEnd (Laravel 10)

Requierement:
- PHP

First set up the DB for the backend. You can choose any driver desired.
