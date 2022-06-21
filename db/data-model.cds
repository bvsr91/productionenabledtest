namespace ferrero.mro;

using {
    managed,
    cuid,
    Currency,
    sap.common
} from '@sap/cds/common';

entity Roles {
    key role        : String;
        description : String;
}

entity Users_Role_Assign {
    key user : String;
        role : String;
}

entity User_Approve_Maintain {
    key userid    : String;
    key managerid : String;
}

entity Vendor_List : managed {
    key ID                        : UUID @odata.Type : 'Edm.String';
    key manufacturerCode          : String;
    key localManufacturerCode     : String;
    key country                   : String;
        manufacturerCodeDesc      : String;
        localManufacturerCodeDesc : String;
        countryDesc               : String;
        initiator                 : String;
        approver                  : String;
        Status                    : String;
}

entity Pricing_Conditions : managed {
    key ManufacturerCode     : String;
    key Country              : String;
        manufacturerCodeDesc : String;
        countryDesc          : String;
        LocalCurrency        : String;
        ExchangeRate         : Decimal(2, 2);
        CountryFactor        : Decimal(2, 2);
        ValidityStart        : Date;
        ValidityEnd          : Date;
        initiator            : String;
        approver             : String;
        ld_initiator         : String;
        Status               : String;
}
