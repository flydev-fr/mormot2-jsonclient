program Project1;

{$I mormot.defines.inc}

{$APPTYPE CONSOLE}

uses
  {$I mormot.uses.inc}
  sysutils,
  mormot.core.base,
  mormot.core.os,
  mormot.core.text,
  mormot.core.rtti,
  mormot.core.json,
  mormot.net.client,
  petstore.client,
  petstore.dto;

var
  petstoreCli: TPetStoreClient;
  jsonClient: IJsonClient;
  pets: TPetDynArray;
begin
  jsonClient := TJsonClient.Create('localhost:8080', '/api/v3');
  try
    jsonClient.SetBearer('eyMy.token');
    petstoreCli := TPetStoreClient.Create(jsonClient);
    //pets := petstoreCli.FindPetsByStatus(ep2Available);
    jsonClient.Request(
      'GET',                  {= method}
      '/pet/findByStatus',    {= base uri + endpoint}
      [],                     {= enpoint (action) fmt}
      ['status', 'available'], {= query name/value array of const}
                               {  |- we want avail. pets ('pending', 'sold' ...) }
      ['My-Header', 'Marmot Pet'],  {= custom headers}
      pets,                   {= return value, the json array of pets}
      TypeInfo(TPetDynArray)  {= type of return value}
    );

    ConsoleWrite('resp. headers: %', [petstoreCli.JsonClient.Http.Headers], ccYellow);
    ConsoleWrite('available pets: %', [DynArraySaveJson(pets, TypeInfo(TPetDynArray))]);
    ConsoleWaitForEnterKey;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
