using ferrero.mro as my from '../db/data-model';

service MroService {
    @readonly
    entity Roles             as projection on my.Roles;

    @readonly
    entity Users             as projection on my.Users;

    @readonly
    entity MaintainApproval  as projection on my.MaintainApproval;

    @readonly
    entity VendorList        as projection on my.VendorList;

    @readonly
    entity PricingConditions as projection on my.PricingConditions;
}
