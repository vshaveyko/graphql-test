import { module } from 'angular'
import { ApolloClient } from 'apollo-client';
import { createNetworkInterface } from 'apollo-client/transport/networkInterface';

module('app').config((apolloProvider) => {
  const client = new ApolloClient({
    networkInterface: createNetworkInterface({
      uri: 'api/graphql',
    }),
  }
  );

  apolloProvider.defaultClient(client);
});

console.log("Config loaded")
