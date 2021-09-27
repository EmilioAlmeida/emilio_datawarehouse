const jwt = require('jsonwebtoken')

const authorizationPassword = 'Arcoiris7'


const { validateLoginQuery, validateEmailQuery, validateUserIdQuery, validateEmailPutQuery,
    validateRegionNameQuery, validateRegionIdQuery, validateRegionNamePutQuery,
    validateCountryNameQuery, validateCountryIdQuery, validateCountryNamePutQuery,
    validateRegionIdCountryQuery, validateCityNameQuery, validateCityIdQuery,
    validateCountryIdCityQuery, validateCityNamePutQuery, validateCompanyNameQuery,
    validateCompanyIdQuery, validateCompanyNamePutQuery, validateCityIdPutQuery,
    validateEmailContactsQuery, validateChannelIdQuery, validateContactIdQuery,
    validateEmailContactsPutQuery, validateCompanyIdPutQuery, validateChannelIdPutQuery,
    validateChannelIdAddQuery, validateChannelIdDelQuery, validateChannelNameQuery,
    validateChannelIdExQuery, validateChannelNamePutQuery} = require('./queries.js')

//users
async function validateLogin(req, res, next) {
    await validateLoginQuery(req, res, next)
}

function verifyToken(req, res, next) {
    const fullToken = req.headers.authorization || "0.0.0"
    const token = fullToken.split(' ')[1]
    try {
        jwt.verify(token, authorizationPassword)
        next()
    } catch (error) {
        res.status(401).send(error)
    }
}

function filterAdmin(req, res, next) {
    const token = req.headers.authorization.split(' ')[1]
    const user = jwt.verify(token, authorizationPassword)
    if(user.perfil === "Admin") {
        next()
    } else {
        res.status(403).send("Usted no tiene permiso de Administrador").end()
    }
}

function validateFirstname(req, res, next) {
    const firstname = req.body.firstname
    if(firstname.length >= 1 && firstname.length <= 64) next()
    else res.status(400).send("El nombre es incorrecto").end()
}

function validateLastname(req, res, next) {
    const lastname = req.body.lastname
    if(lastname.length >= 1 && lastname.length <= 64) next()
    else res.status(400).send("El apellido es incorrecto").end()
}

async function validateEmail(req, res, next) {
    await validateEmailQuery(req, res, next)
}

function validatePassword(req, res, next) {
    const password = req.body.password
    if(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d$@$!%*?&#.$($)$-$_]{4,15}$/.test(password)) next()
    else res.status(400).send("El password es incorrecto").end()
}
// Minimum 4 characters
// Maximum 15 characters
// At least 1 character
// At least 1 digit
// No blank spaces

function validateUser(req, res, next) {
    const userId = +req.params.userId
    const token = jwt.verify(req.headers.authorization.split(' ')[1], authorizationPassword)
    if(token.user_id === userId || token.perfil === "Admin") next()
    else res.status(401).send("Usted no cuenta con permisos suficientes").end()
}

async function validateUserId(req, res, next) {
    await validateUserIdQuery(req, res, next)
}

function validateFirstnamePut(req, res, next) {
    if(req.body.firstname.length >= 1 && req.body.firstname.length <= 64) next()  
    else res.status(400).send("El nombre no es muy largo").end()
}

function validateLastnamePut(req, res, next) {
    if(req.body.lastname.length >= 1 && req.body.lastname.length <= 64) next()  
    else res.status(400).send("El apellido es muy largo").end()
}

async function validateEmailPut(req, res, next) {
    await validateEmailPutQuery(req, res, next)
}

function validatePerfil(req, res, next) { 
    if(req.body.perfil === 'Admin' || req.body.perfil === 'Básico') next()
    else res.status(400).send("El perfil es incorrecto").end()
}

function validatePasswordPut(req, res, next) {
    if(req.body.password) {
        if(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d$@$!%*?&#.$($)$-$_]{4,15}$/.test(req.body.password)) next()
        else res.status(400).send("El password es incorrecto").end()
    } else next()
}

//regions
async function validateRegionName(req, res, next) {
    await validateRegionNameQuery(req, res, next)
}

async function validateRegionId(req, res, next) {
    await validateRegionIdQuery(req, res, next)
}

async function validateRegionNamePut(req, res, next) {
    await validateRegionNamePutQuery(req, res, next)
}

//countries 
async function validateCountryName(req, res, next) {
    await validateCountryNameQuery(req, res, next)
}

async function validateCountryId(req, res, next) {
    await validateCountryIdQuery(req, res, next)
}

async function validateCountryNamePut(req, res, next) {
    await validateCountryNamePutQuery(req, res, next)
}

async function validateRegionIdCountry(req, res, next) {
    await validateRegionIdCountryQuery(req, res, next)
}

//cities
async function validateCityName(req, res, next) {
    await validateCityNameQuery(req, res, next)
}

async function validateCityId(req, res, next) {
    await validateCityIdQuery(req, res, next)
}

async function validateCountryIdCity(req, res, next) {
    await validateCountryIdCityQuery(req, res, next)
}

async function validateCityNamePut(req, res, next) {
    await validateCityNamePutQuery(req, res, next)
}

//companies
async function validateCompanyName(req, res, next) {
    await validateCompanyNameQuery(req, res, next)
}

function validateAddress(req, res, next) {
    const address = req.body.address
    if(address.length >= 1 && address.length <= 64) next()
    else res.status(400).send("La dirección es incorrecta").end()
}

async function validateEmailCompanies(req, res, next) {
    const email = req.body.email
    if(/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(email)) next()
    else res.status(400).send("El mail es incorrecto").end()
}

function validateTelephone(req, res, next) {
    const telephone = req.body.telephone
    if(telephone.length >= 1 && telephone.length <= 64) next()
    else res.status(400).send("El teléfono es incorrecto").end()
}

async function validateCompanyId(req, res, next) {
    await validateCompanyIdQuery(req, res, next)
}

async function validateCompanyNamePut(req, res, next) {
    await validateCompanyNamePutQuery(req, res, next)
}

async function validateCityIdPut(req, res, next) {
    await validateCityIdPutQuery(req, res, next)
}

async function validateAddressPut(req, res, next) {
    const address = req.body.address
    if(address.length >= 1 && address.length <= 64) next()
    else res.status(400).send("La dirección es incorrecta").end()
}

//contacts
async function validateEmailContacts(req, res, next) {
    await validateEmailContactsQuery(req, res, next)
}

function validatePosition(req, res, next) {
    const position = req.body.position
    if(position.length >= 1 && position.length <= 64) next()
    else res.status(400).send("La posición es incorrecta").end()
}

function validateInterest(req, res, next) {
    const interest = req.body.interest
    if(Number.isInteger(interest) && interest >= 0 && interest <= 100) next()
    else res.status(400).send("Los intereses son incorrectos").end()
}

async function validateChannelId(req, res, next) {
    await validateChannelIdQuery(req, res, next)
}

async function validateContactId(req, res, next) {
    await validateContactIdQuery(req, res, next)
}

function validateUserAccount(req, res, next) {
    const channelsBody = req.body.preferred_channels
    channelsBody.every(element => { 
        if(element.user_account.length >= 1 && element.user_account.length <= 64) next()
        else res.status(400).send("La extension del usuario es incorrecta").end()
    })
}

async function validatePreference(req, res, next) {
    const channelsBody = req.body.preferred_channels
    channelsBody.every(element => { 
        if(element.preference === 'Sin preferencia' || element.preference === 'Canal favorito' 
        || element.preference === 'No molestar') next()
        else res.status(400).send("La preferencia es incorrecta").end()
    })
}

async function validateEmailContactsPut(req, res, next) {
    await validateEmailContactsPutQuery(req, res, next)
}

async function validateCompanyIdPut(req, res, next) {
    await validateCompanyIdPutQuery(req, res, next)
}

function validatePositionPut(req, res, next) {
    if(req.body.position) {
        const position = req.body.position
        if(position.length >= 1 && position.length <= 64) next()
        else res.status(400).send("La posición es incorrecta").end()
    } else next()
}

function validateInterestPut(req, res, next) {
    if(req.body.interest) {
        const interest = req.body.interest
        if(Number.isInteger(interest) && interest >= 0 && interest <= 100) next()
        else res.status(400).send("Los intereses son incorrectos").end()
    } else next()
}

async function validateChannelIdPut(req, res, next) {
    await validateChannelIdPutQuery(req, res, next)
}

async function validateChannelIdAdd(req, res, next) {
    await validateChannelIdAddQuery(req, res, next)
}

async function validateChannelIdDel(req, res, next) {
    await validateChannelIdDelQuery(req, res, next)
}

async function validateChannelName(req, res, next) {
    await validateChannelNameQuery(req, res, next)
}

async function validateChannelIdEx(req, res, next) {
    await validateChannelIdExQuery(req, res, next)
}

async function validateChannelNamePut(req, res, next) {
    await validateChannelNamePutQuery(req, res, next)
}

module.exports = { validateLogin, verifyToken, filterAdmin, validateFirstname, validateLastname, 
    validateEmail, validatePassword, validateUser, validateUserId, validateFirstnamePut, 
    validateLastnamePut, validateEmailPut, validatePerfil, validatePasswordPut, validateRegionName, 
    validateRegionId, validateRegionNamePut, validateCountryName, validateCountryId, 
    validateCountryNamePut, validateRegionIdCountry, validateCityName, validateCityId, 
    validateCountryIdCity, validateCityNamePut, validateCompanyName, validateAddress, 
    validateEmailCompanies, validateCompanyId, validateTelephone, validateCompanyNamePut, 
    validateCityIdPut, validateAddressPut, validateEmailContacts, validatePosition, 
    validateInterest, validateChannelId, validateUserAccount, validatePreference, validateContactId, 
    validateEmailContactsPut, validateCompanyIdPut, validatePositionPut, validateInterestPut, 
    validateChannelIdPut, validateChannelIdAdd, validateChannelIdDel, validateChannelName, 
    validateChannelIdEx, validateChannelNamePut
}