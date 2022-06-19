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

entity Users {
    key user : String;
    key role : String;
}

entity MaintainApproval {
    key userid    : String;
    key managerid : String;
}

entity VendorList : managed {
    key ManufacturerCode      : String;
    key LocalManufacturerCode : String;
    key Country               : String;
        Status                : String;
}

entity PricingConditions : managed {
    key ManufacturerCode : String;
    key Country          : String;
        LocalCurrency    : Currency;
        ExchangeRate     : Decimal(2, 2);
        CountryFactor    : Decimal(2, 2);
        ValidityStart    : Date;
        ValidityEnd      : Date;
        Status           : String;
}
