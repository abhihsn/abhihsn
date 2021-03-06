var express = require("express");
var app = express();
var port = 3000;

var mongoose = require("mongoose");
mongoose.Promise = global.Promise;
mongoose.connect("mongodb://localhost:27017/node-demo", { useNewUrlParser: true });


app.use(express.json())

var nameSchema = new mongoose.Schema({
    firstName: String,
    lastName: String
});

// app.get("/", (req, res) => {
//     res.sendFile(__dirname + "/index.html");
// });


var User = mongoose.model("AppUser", nameSchema);

app.get("/app/user/_all", (req, res) => {
    User.find((err,users) => {
        if (err) return res.status(400).json(err);
        if(!users.length) return res.status(404).json({ users: "Not Found" })
        return res.json(users);
    });
});

app.get("/app/user/:id", (req, res) => {
    User.findById(req.params.id,(err,user) => {
        if (err) return res.status(400).json(err);
        if(!user) return res.status(404).json({ user: "Not Found" })
        return res.json(user);
    });
});


app.post("/app/user", (req, res) => {

    var user = new User(req.body);
    console.log(req.body);
    user.save()
        .then(item => {
            res.json(item);
        })
        .catch(err => {
            res.status(400).json(err);
        });
});

app.delete("/app/user/:id", (req, res) => {
    var id = req.params.id;
    User.findByIdAndRemove(id, { sort: "_id" }, (err, data) => {
        if (err) return res.status(400).json(err);
        if (!data) return res.status(404).json({ id: "Not Found" })
        return res.json({ deleted: data });
    });
});

app.put('/app/user/:id', function(req, res) {
    
    var id = req.params.id;
    var data = {
        firstName : req.body.firstName,
        lastName : req.body.lastName
    }

    // save the user
    User.findByIdAndUpdate(id, data, function(err, user) {
    if (err) throw err;

    res.send('Document Updated Successfully..!');
    });
});

app.listen(port, '0.0.0.0', () => {
    console.log("Server listening on port " + port);
});
