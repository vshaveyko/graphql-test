import { module } from 'angular'

// import { AppModule } from './app/app.module';

console.log("Test")

import ApolloClient from 'apollo-client';

import gql from 'graphql-tag';

const dependencies = [
  'apollo'
] as any

class AppCtrl {

  private apollo: any;
  private result: any;
  private user: any;

  constructor(apollo) {
    this.apollo = apollo;
  }

  $onInit() {
    this.apollo.query({
      query: gql`
          query currentUser {
            user(id: 1) {
              id,
              email,
              name
            }
          }
        `
    }).then(result => {
      this.user = result.data.user;
    });
  }

}

module('app').controller('AppCtrl', dependencies.concat(AppCtrl));

module('app')
  .component('appComponent', {
    controller: 'AppCtrl',
    template: `
     <span>
       Hello world angularjs + apollo {{ $ctrl.user.id }} name {{ $ctrl.user.name }}
     </span>
   `
  })

console.log("Component loaded")
