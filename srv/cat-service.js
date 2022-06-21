const cds = require('@sap/cds')
module.exports = async function () {
    const db = await cds.connect.to('db')
    const {
        Roles,
        Users_Role_Assign
    } = db.entities("ferrero.mro");
    this.on("READ", "Roles", async (req, res) => {
        // const { SELECT } = cds.ql(req);
        var aFilter = req.query.SELECT.where;
        if(aFilter === undefined){
            return await SELECT.from(Roles);
        }
        const result = await SELECT.from(Roles).where(aFilter);
        // const result = await SELECT.from(Users_Role_Assign);
        const result_where = await SELECT.from(Users_Role_Assign).where({role:"CDT"});
        console.log(result);
        return result;
        // return result;
    });
}