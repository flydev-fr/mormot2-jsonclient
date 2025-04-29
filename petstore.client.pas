// Client unit for Swagger Petstore - OpenAPI 3.0
// - This is a sample Pet Store Server based on the OpenAPI 3.0 specification.
//  You can find out more about
// Swagger at [https://swagger.io](https://swagger.io). In the third iteration
// of the pet store, we've switched to the design first approach!
// You can now help us improve the API whether it's by making changes to the definition
// itself or to the code.
// That way, with time, we can improve the API in general, and expose some of
// the new features in OAS3.
// Some useful links:
// - [The Pet Store repository](https://github.com/swagger-api/swagger-petstore)
// - [The source API definition for the Pet Store](https://github.com/swagger-api/swagger-petstore/blob/master/src/main/resources/openapi.yaml)
// - version 1.0.26
// - OpenAPI definition licensed under Apache 2.0 terms
unit petstore.client;

{$I mormot.defines.inc}

interface

{
  ---------------------------------------------------------------------
  SWAGGER PETSTORE - OPENAPI 3.0 client as TPetstoreClient class

  Generated 29 Apr 2025 by flydev via mopenapi - DO NOT MODIFY BY HAND!
  ---------------------------------------------------------------------
}

uses
  classes,
  sysutils,
  mormot.core.base,
  mormot.core.unicode,
  mormot.core.text,
  mormot.core.buffers,
  mormot.core.datetime,
  mormot.core.rtti,
  mormot.core.json,
  mormot.core.variants,
  mormot.net.client,
  petstore.dto;

type

{ ************ Main TPetstoreClient Class }

  // Client class for Swagger Petstore - OpenAPI 3.0
  // - This is a sample Pet Store Server based on the OpenAPI 3.0 specification.
  //  You can find out more about
  // Swagger at [https://swagger.io](https://swagger.io). In the third iteration
  // of the pet store, we've switched to the design first approach!
  // You can now help us improve the API whether it's by making changes to the definition
  // itself or to the code.
  // That way, with time, we can improve the API in general, and expose some of
  // the new features in OAS3.
  // Some useful links:
  // - [The Pet Store repository](https://github.com/swagger-api/swagger-petstore)
  // - [The source API definition for the Pet Store](https://github.com/swagger-api/swagger-petstore/blob/master/src/main/resources/openapi.yaml)
  TPetstoreClient = class
  private
    fClient: IJsonClient;
  public

    // initialize this Client with an associated HTTP/JSON request
    constructor Create(const aClient: IJsonClient);


    // -------------
    //  PET METHODS
    // -------------
    // - Everything about your Pets


    // updatePet [put] /pet
    //
    // Summary: Update an existing pet.
    // Description:
    //   Update an existing pet by Id.
    //
    // Params:
    // - [body] Payload  (required)
    //
    // Responses:
    // - 200 (main): Successful operation
    // - 400: Invalid ID supplied
    // - 404: Pet not found
    // - 422: Validation exception
    // - default: Unexpected error
    function UpdatePet(const Payload: TPet): TPet;

    // addPet [post] /pet
    //
    // Summary: Add a new pet to the store.
    // Description:
    //   Add a new pet to the store.
    //
    // Params:
    // - [body] Payload  (required)
    //
    // Responses:
    // - 200 (main): Successful operation
    // - 400: Invalid input
    // - 422: Validation exception
    // - default: Unexpected error
    function AddPet(const Payload: TPet): TPet;

    // findPetsByStatus [get] /pet/findByStatus
    //
    // Summary: Finds Pets by status.
    // Description:
    //   Multiple status values can be provided with comma separated strings.
    //
    // Params:
    // - [query] Status: Status values that need to be considered for filter
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid status value
    // - default: Unexpected error
    function FindPetsByStatus(const Status: TEnumPetstore2 = ep2None): TPetDynArray;

    // findPetsByTags [get] /pet/findByTags
    //
    // Summary: Finds Pets by tags.
    // Description:
    //   Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
    //
    // Params:
    // - [query] Tags: Tags to filter by
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid tag value
    // - default: Unexpected error
    function FindPetsByTags(const Tags: TRawUtf8DynArray = nil): TPetDynArray;

    // getPetById [get] /pet/{petId}
    //
    // Summary: Find pet by ID.
    // Description:
    //   Returns a single pet.
    //
    // Params:
    // - [path] PetId (required): ID of pet to return
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid ID supplied
    // - 404: Pet not found
    // - default: Unexpected error
    function GetPetById(PetId: Int64): TPet;

    // updatePetWithForm [post] /pet/{petId}
    //
    // Summary: Updates a pet in the store with form data.
    // Description:
    //   Updates a pet resource based on the form data.
    //
    // Params:
    // - [path] PetId (required): ID of pet that needs to be updated
    // - [query] Name: Name of pet that needs to be updated
    // - [query] Status: Status of pet that needs to be updated
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid input
    // - default: Unexpected error
    function UpdatePetWithForm(PetId: Int64; const Name: RawUtf8 = ''; const Status: RawUtf8 = ''): TPet;

    // deletePet [delete] /pet/{petId}
    //
    // Summary: Deletes a pet.
    // Description:
    //   Delete a pet.
    //
    // Params:
    // - [header] ApiKey
    // - [path] PetId (required): Pet id to delete
    //
    // Responses:
    // - 200 (main): Pet deleted
    // - 400: Invalid pet value
    // - default: Unexpected error
    procedure DeletePet(PetId: Int64; const ApiKey: RawUtf8 = '');

    // uploadFile [post] /pet/{petId}/uploadImage
    //
    // Summary: Uploads an image.
    // Description:
    //   Upload image of the pet.
    //
    // Params:
    // - [path] PetId (required): ID of pet to update
    // - [query] AdditionalMetadata: Additional Metadata
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: No file uploaded
    // - 404: Pet not found
    // - default: Unexpected error
    function UploadFile(PetId: Int64; const AdditionalMetadata: RawUtf8 = ''): TApiResponse;


    // ---------------
    //  STORE METHODS
    // ---------------
    // - Access to Petstore orders


    // getInventory [get] /store/inventory
    //
    // Summary: Returns pet inventories by status.
    // Description:
    //   Returns a map of status codes to quantities.
    //
    // Responses:
    // - 200 (main): successful operation
    // - default: Unexpected error
    function GetInventory(): variant;

    // placeOrder [post] /store/order
    //
    // Summary: Place an order for a pet.
    // Description:
    //   Place a new order in the store.
    //
    // Params:
    // - [body] Payload  (required)
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid input
    // - 422: Validation exception
    // - default: Unexpected error
    function PlaceOrder(const Payload: TOrder): TOrder;

    // getOrderById [get] /store/order/{orderId}
    //
    // Summary: Find purchase order by ID.
    // Description:
    //   For valid response try integer IDs with value <= 5 or > 10. Other values will generate exceptions.
    //
    // Params:
    // - [path] OrderId (required): ID of order that needs to be fetched
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid ID supplied
    // - 404: Order not found
    // - default: Unexpected error
    function GetOrderById(OrderId: Int64): TOrder;

    // deleteOrder [delete] /store/order/{orderId}
    //
    // Summary: Delete purchase order by identifier.
    // Description:
    //   For valid response try integer IDs with value < 1000. Anything above 1000 or non-integers will generate API errors.
    //
    // Params:
    // - [path] OrderId (required): ID of the order that needs to be deleted
    //
    // Responses:
    // - 200 (main): order deleted
    // - 400: Invalid ID supplied
    // - 404: Order not found
    // - default: Unexpected error
    procedure DeleteOrder(OrderId: Int64);


    // --------------
    //  USER METHODS
    // --------------
    // - Operations about user


    // createUser [post] /user
    //
    // Summary: Create user.
    // Description:
    //   This can only be done by the logged in user.
    //
    // Params:
    // - [body] Payload  (required)
    //
    // Responses:
    // - 200 (main): successful operation
    // - default: Unexpected error
    function CreateUser(const Payload: TUser): TUser;

    // createUsersWithListInput [post] /user/createWithList
    //
    // Summary: Creates list of users with given input array.
    // Description:
    //   Creates list of users with given input array.
    //
    // Params:
    // - [body] Payload  (required)
    //
    // Responses:
    // - 200 (main): Successful operation
    // - default: Unexpected error
    function CreateUsersWithListInput(const Payload: TUserDynArray): TUser;

    // loginUser [get] /user/login
    //
    // Summary: Logs user into the system.
    // Description:
    //   Log into the system.
    //
    // Params:
    // - [query] Username: The user name for login
    // - [query] Password: The password for login in clear text
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid username/password supplied
    // - default: Unexpected error
    function LoginUser(const Username: RawUtf8 = ''; const Password: RawUtf8 = ''): RawUtf8;

    // logoutUser [get] /user/logout
    //
    // Summary: Logs out current logged in user session.
    // Description:
    //   Log user out of the system.
    //
    // Responses:
    // - 200 (main): successful operation
    // - default: Unexpected error
    procedure LogoutUser();

    // getUserByName [get] /user/{username}
    //
    // Summary: Get user by user name.
    // Description:
    //   Get user detail based on username.
    //
    // Params:
    // - [path] Username (required): The name that needs to be fetched. Use user1
    // for testing
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: Invalid username supplied
    // - 404: User not found
    // - default: Unexpected error
    function GetUserByName(const Username: RawUtf8): TUser;

    // updateUser [put] /user/{username}
    //
    // Summary: Update user resource.
    // Description:
    //   This can only be done by the logged in user.
    //
    // Params:
    // - [path] Username (required): name that need to be deleted
    // - [body] Payload  (required)
    //
    // Responses:
    // - 200 (main): successful operation
    // - 400: bad request
    // - 404: user not found
    // - default: Unexpected error
    procedure UpdateUser(const Username: RawUtf8; const Payload: TUser);

    // deleteUser [delete] /user/{username}
    //
    // Summary: Delete user resource.
    // Description:
    //   This can only be done by the logged in user.
    //
    // Params:
    // - [path] Username (required): The name that needs to be deleted
    //
    // Responses:
    // - 200 (main): User deleted
    // - 400: Invalid username supplied
    // - 404: User not found
    // - default: Unexpected error
    procedure DeleteUser(const Username: RawUtf8);

    // access to the associated HTTP/JSON client instance
    property JsonClient: IJsonClient
      read fClient write fClient;
  end;


implementation



{ ************ Main TPetstoreClient Class }

{ TPetstoreClient}

constructor TPetstoreClient.Create(const aClient: IJsonClient);
begin
  fClient := aClient;
  fClient.Options := [jcoParseTolerant, jcoHttpErrorRaise];
  fClient.UrlEncoder :=
    [ueEncodeNames, ueSkipVoidString, ueSkipVoidValue, ueStarNameIsCsv];
end;

function TPetstoreClient.UpdatePet(const Payload: TPet): TPet;
begin
  fClient.Request('PUT', '/pet', [], [], [],
    Payload, result, TypeInfo(TPet), TypeInfo(TPet));
end;

function TPetstoreClient.AddPet(const Payload: TPet): TPet;
begin
  fClient.Request('POST', '/pet', [], [], [],
    Payload, result, TypeInfo(TPet), TypeInfo(TPet));
end;

function TPetstoreClient.FindPetsByStatus(const Status: TEnumPetstore2): TPetDynArray;
begin
  fClient.Request('GET', '/pet/findByStatus', [], [
    'status', ENUMPETSTORE2_TXT[Status]], [],
    result, TypeInfo(TPetDynArray));
end;

function TPetstoreClient.FindPetsByTags(const Tags: TRawUtf8DynArray): TPetDynArray;
begin
  fClient.Request('GET', '/pet/findByTags', [], [
    '*tags', RawUtf8ArrayToCsv(Tags)], [],
    result, TypeInfo(TPetDynArray));
end;

function TPetstoreClient.GetPetById(PetId: Int64): TPet;
begin
  fClient.Request('GET', '/pet/%', [PetId], [], [],
    result, TypeInfo(TPet));
end;

function TPetstoreClient.UpdatePetWithForm(PetId: Int64; const Name: RawUtf8;
  const Status: RawUtf8): TPet;
begin
  fClient.Request('POST', '/pet/%', [PetId], [
    'name', Name,
    'status', Status], [],
    result, TypeInfo(TPet));
end;

procedure TPetstoreClient.DeletePet(PetId: Int64; const ApiKey: RawUtf8);
begin
  fClient.Request('DELETE', '/pet/%', [PetId], [], [
    'api_key', ApiKey]);
end;

function TPetstoreClient.UploadFile(PetId: Int64; const AdditionalMetadata: RawUtf8): TApiResponse;
begin
  fClient.Request('POST', '/pet/%/uploadImage', [PetId], [
    'additionalMetadata', AdditionalMetadata], [],
    result, TypeInfo(TApiResponse));
end;

function TPetstoreClient.GetInventory(): variant;
begin
  fClient.Request('GET', '/store/inventory', [], [], [],
    result, TypeInfo(variant));
end;

function TPetstoreClient.PlaceOrder(const Payload: TOrder): TOrder;
begin
  fClient.Request('POST', '/store/order', [], [], [],
    Payload, result, TypeInfo(TOrder), TypeInfo(TOrder));
end;

function TPetstoreClient.GetOrderById(OrderId: Int64): TOrder;
begin
  fClient.Request('GET', '/store/order/%', [OrderId], [], [],
    result, TypeInfo(TOrder));
end;

procedure TPetstoreClient.DeleteOrder(OrderId: Int64);
begin
  fClient.Request('DELETE', '/store/order/%', [OrderId], [], []);
end;

function TPetstoreClient.CreateUser(const Payload: TUser): TUser;
begin
  fClient.Request('POST', '/user', [], [], [],
    Payload, result, TypeInfo(TUser), TypeInfo(TUser));
end;

function TPetstoreClient.CreateUsersWithListInput(const Payload: TUserDynArray): TUser;
begin
  fClient.Request('POST', '/user/createWithList', [], [], [],
    Payload, result, TypeInfo(TUserDynArray), TypeInfo(TUser));
end;

function TPetstoreClient.LoginUser(const Username: RawUtf8; const Password: RawUtf8): RawUtf8;
begin
  fClient.Request('GET', '/user/login', [], [
    'username', Username,
    'password', Password], [],
    result, TypeInfo(RawUtf8));
end;

procedure TPetstoreClient.LogoutUser();
begin
  fClient.Request('GET', '/user/logout', [], [], []);
end;

function TPetstoreClient.GetUserByName(const Username: RawUtf8): TUser;
begin
  fClient.Request('GET', '/user/%', [Username], [], [],
    result, TypeInfo(TUser));
end;

procedure TPetstoreClient.UpdateUser(const Username: RawUtf8; const Payload: TUser);
begin
  fClient.Request('PUT', '/user/%', [Username], [], [],
    Payload, {dummy:}self, TypeInfo(TUser), nil);
end;

procedure TPetstoreClient.DeleteUser(const Username: RawUtf8);
begin
  fClient.Request('DELETE', '/user/%', [Username], [], []);
end;


end.