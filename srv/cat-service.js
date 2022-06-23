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
        if (aFilter === undefined) {
            return await SELECT.from(Roles);
        }
        const result = await SELECT.from(Roles).where(aFilter);
        // const result = await SELECT.from(Users_Role_Assign);
        const result_where = await SELECT.from(Users_Role_Assign).where({ role: "CDT" });
        console.log(result);
        return result;
        // return result;
    });

    this.on("UPDATE", "UpdateUsers", async (req, next) => {
        const user = req.data.user;
        const role = req.data.role;
        var result = await next();
        const db = await cds.connect.to('db')
        const {
            Roles,
            Users_Role_Assign
        } = db.entities("ferrero.mro");
        const aRoles = await SELECT.from(Roles).where({ role: req.data.role });
        if (aRoles.length > 0) {
            try {
                let result1 = await UPDATE(Users_Role_Assign)
                    .set({
                        role: req.data.role
                    }).where({ user: req.data.user });
                console.log(result);
            } catch (err) {
                return err;
            }
            return result;
        }else{
            req.error(400, "Invalid Role " +  req.data.role);
        }
    });
}