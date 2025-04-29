// DTOs for Swagger Petstore - OpenAPI 3.0
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
unit petstore.dto;

{$I mormot.defines.inc}

interface

{
  ---------------------------------------------------------------------
  SWAGGER PETSTORE - OPENAPI 3.0 DTOs

  Generated 29 Apr 2025 by flydev via mopenapi - DO NOT MODIFY BY HAND!
  ---------------------------------------------------------------------
}

uses
  classes,
  sysutils,
  mormot.core.base,
  mormot.core.rtti,
  mormot.core.json;

type

{ ************ Enumerations and Sets }

  // Order Status
  TEnumPetstore1 = (
    epNone, epApproved, epDelivered, epPlaced);
  // pet status in the store
  TEnumPetstore2 = (
    ep2None, ep2Available, ep2Pending, ep2Sold);


{ ************ Data Transfert Objects }

  // from #/components/schemas/Order
  TOrder = packed record
    Id: Int64;
    PetId: Int64;
    Quantity: integer;
    ShipDate: TDateTime;
    // Order Status
    // - Example: "approved"
    Status: TEnumPetstore1;
    Complete: boolean;
  end;
  POrder = ^TOrder;

  // from #/components/schemas/Category
  TCategory = packed record
    Id: Int64;
    Name: RawUtf8;
  end;
  PCategory = ^TCategory;

  // from #/components/schemas/User
  TUser = packed record
    Id: Int64;
    Username: RawUtf8;
    FirstName: RawUtf8;
    LastName: RawUtf8;
    Email: RawUtf8;
    Password: RawUtf8;
    Phone: RawUtf8;
    // User Status
    // - Example: 1
    UserStatus: integer;
  end;
  PUser = ^TUser;
  TUserDynArray = array of TUser;

  // from #/components/schemas/Tag
  TTag = packed record
    Id: Int64;
    Name: RawUtf8;
  end;
  PTag = ^TTag;
  TTagDynArray = array of TTag;

  // from #/components/schemas/Pet
  TPet = packed record
    Id: Int64;
    Name: RawUtf8;
    Category: TCategory;
    PhotoUrls: TRawUtf8DynArray;
    Tags: TTagDynArray;
    // pet status in the store
    Status: TEnumPetstore2;
  end;
  PPet = ^TPet;
  TPetDynArray = array of TPet;

  // from #/components/schemas/ApiResponse
  TApiResponse = packed record
    Code: integer;
    _Type: RawUtf8;
    Message: RawUtf8;
  end;
  PApiResponse = ^TApiResponse;



const
  // define how enums/sets are actually transmitted as JSON array of string
  ENUMPETSTORE1_TXT: array[TEnumPetstore1] of RawUtf8 = (
    '', 'approved', 'delivered', 'placed');
  ENUMPETSTORE2_TXT: array[TEnumPetstore2] of RawUtf8 = (
    '', 'available', 'pending', 'sold');


implementation

{ ************ Custom RTTI/JSON initialization }

const
  // exact definition of the DTOs expected JSON serialization
  _TOrder = 'id:Int64 petId:Int64 quantity:integer shipDate:TDateTime status:TEnumPetstore1 ' +
    'complete:boolean';
  _TCategory = 'id:Int64 name:RawUtf8';
  _TUser = 'id:Int64 username:RawUtf8 firstName:RawUtf8 lastName:RawUtf8 ' +
    'email:RawUtf8 password:RawUtf8 phone:RawUtf8 userStatus:integer';
  _TTag = 'id:Int64 name:RawUtf8';
  _TPet = 'id:Int64 name:RawUtf8 category:TCategory photoUrls:TRawUtf8DynArray ' +
    'tags:array of TTag status:TEnumPetstore2';
  _TApiResponse = 'code:integer type:RawUtf8 message:RawUtf8';


procedure RegisterRtti;
begin
  TRttiJson.RegisterCustomEnumValues([
    TypeInfo(TEnumPetstore1), nil, @ENUMPETSTORE1_TXT,
    TypeInfo(TEnumPetstore2), nil, @ENUMPETSTORE2_TXT]);
  Rtti.RegisterFromText([
    TypeInfo(TOrder), _TOrder,
    TypeInfo(TCategory), _TCategory,
    TypeInfo(TUser), _TUser,
    TypeInfo(TTag), _TTag,
    TypeInfo(TPet), _TPet,
    TypeInfo(TApiResponse), _TApiResponse]);
end;

initialization
  RegisterRtti;

end.
