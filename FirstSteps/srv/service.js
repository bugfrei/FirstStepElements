const cds = require('@sap/cds')

module.exports = srv => {

    const {Personal} = srv.entities('AdminService')

    srv.after(['READ','WRITE','UPDATE'], 'Personal', (each) => {
        //for not Busted only
            each.testEnabled = (each.firstName !== 'BUSTED' );
        // //for active inquires only
        // if (each.status_code !== '3') { // wer denkt sich so einen Unsinn aus o.O
        //     each.testEnabled = true
        // }
    })   

    srv.on("testfunction", Personal, async req => {
        // console.log(req.query)
        // const result = await cds.run(req.query);
        // return result
        let personalId = (req.params[0]).id
        //console.log(req)
        
            
            
            // let b = await SELECT `stock` .from (Books,book)
            // await UPDATE (Books,book) .with ({ stock: stock -= quantity })
          //Hier noch testen ob das geht
        await SELECT.one.from(Personal, personalId)
        
        await UPDATE(Personal).set({ firstName:'BUSTED'}).where ({id:personalId})
        await UPDATE(Personal).set({ testEnabled:true}).where ({id:personalId}) //Updatet die Sichtbarkeit des Funktionsbuttons
        return await SELECT('*').from(Personal).where({id:personalId}) // DIESER RETURN REFRESHED DIE ID IN DER TABELLE
        });
    srv.on("movePersonalToNewAbteilung", Personal,async (req) => {
        let personalId = (req.params[0]).id
        //console.log(req.data)
        const { abteilungId } = req.data; //lese die parameter aus und speicher die Werte in eigenen variablen

        //!!const db = srv.transaction(req); //Server Transaktion in Verbindung mit diesem request

        // let {Personal} = srv.entities; 
        // let {Abteilungen} = srv.entities;
        //Kurzform nächste Zeile 
        let { Personal, Abteilungen } = srv.entities; //Entities Personal aus dem server extrahieren
        // let {Personal : Per, Abteilungen :  Abt} = srv.entities; Falls die Variable schon zb. {Personal}
        //heißt kann man sich mit {Abteilungen :  Abt} helfen

        //!!let [{ max, name }] = await db.read('max', 'name').from(Abteilungen).where({ id: abteilungId });
        let [{ max }] = await SELECT('*').from(Abteilungen).where({ id: abteilungId })
        //!!let [{ anzahl }] = await db.read('count(*) as anzahl').from(Personal).where({ toAbteilung_id: abteilungId });
        let [{ anzahl }] = await SELECT('count(*) as anzahl').from(Personal).where({ toAbteilung_id: abteilungId })
        let [{ anzahl: anzahl1 }] = await SELECT.from `Personal` .columns `{count(*) as anzahl}`.where({ toAbteilung_id: abteilungId })
        //let [{ wtf is this }]SELECT.from`Foo` .columns `{ a, b as c, count(d) as e }
        console.log(anzahl1)
        if (anzahl < max) {
            //!!await db.update(Personal).set({ toAbteilung_id: abteilungId }).where({ id: personalId });
            await UPDATE(Personal).set({ toAbteilung_id: abteilungId }).where({ id:personalId })

            
            //let [{ firstName }] = await db.read('firstName').from(Personal).where({ id: personalId }); //firstName auslesen für Return

            // let {Abteilungen} = srv.entities;
            // const name = await db.read(Abteilungen).where({id : abteilungId});

            return await SELECT('*').from(Personal).where({ id:personalId })
            // {
            //     success: true,
            //     personalId: personalId,
            //     firstName,
            //     abteilungId: abteilungId,
            //     abteilungName: abteilungsName
            // }
        }
        else {
            // Möglichkeit 1: HTTP Error
            req.error({
                code: 'To many user in department',
                message: `Only ${max} users allowed`,
                target: 'movePersonalToNewAbteilung',
                status: 418,
            })
            // dann werden die Zeilen darunter nicht ausgeführt

            // Möglichkeit 2: Rückgabeobjekt
            return {
                success: false
            }
        }
    })
}