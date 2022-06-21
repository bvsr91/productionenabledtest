using ferrero.mro as my from '../db/data-model';

service MroService {
    @readonly
    entity Roles             as projection on my.Roles;

    @readonly
    entity Users             as projection on my.Users_Role_Assign;

    @readonly
    entity MaintainApproval  as projection on my.User_Approve_Maintain;

    @readonly
    entity VendorList        as projection on my.Vendor_List;

    @readonly
    entity PricingConditions as projection on my.Pricing_Conditions;
}
