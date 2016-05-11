/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function checkCreateAdmin() {
    var flag = true;

    var name = $('#adminName');
    var pass = $('#password');
    var repass = $('#repassword');

    var parentAdminName = name.parent('div');
    var parentAdminPass = pass.parent('div');
    var parentAdminRepass = repass.parent('div');

    if (pass.val().trim() === "") {
        parentAdminPass.addClass('has-error');
        parentAdminPass.tooltip({title: 'Password required', placement: 'top'});
        parentAdminPass.tooltip('show');
        pass.val('');
        pass.focus();
        flag = false;
    } else {
        if (parentAdminPass.hasClass('has-error')) {
            parentAdminPass.removeClass('has-error');
        }
        parentAdminPass.addClass('has-success');
        parentAdminPass.tooltip('hide');
    }
    if (name.val().trim() === "") {
        parentAdminName.addClass('has-error');
        parentAdminName.tooltip({title: 'Admin name required', placement: 'top'});
        parentAdminName.tooltip('show');
        name.val('');
        name.focus();
        flag = false;
    } else {
        if (parentAdminName.hasClass('has-error')) {
            parentAdminName.removeClass('has-error');
        }
        parentAdminName.addClass('has-success');
        parentAdminName.tooltip('hide');
    }
    if (repass.val().trim() === "") {
        parentAdminRepass.addClass('has-error');
        parentAdminRepass.tooltip({title: 'Repassword required', placement: 'top'});
        parentAdminRepass.tooltip('show');
        repass.val('');
        pass.focus();
        flag = false;
    }
    if (repass.val().trim() !== "" && pass.val().trim() !== "") {
        if (repass.val().trim() !== pass.val().trim()) {
            if (parentAdminRepass.hasClass('has-error')) {
                parentAdminRepass.removeClass('has-error');
            }
            parentAdminRepass.addClass('has-error');
            parentAdminRepass.tooltip('hide');
            parentAdminRepass.attr('data-original-title', 'repassword missmatch');
            parentAdminRepass.tooltip('fixTitle');
            parentAdminRepass.tooltip('show');
            flag=false;
        } else {
            if (parentAdminPass.hasClass('has-error')) {
                parentAdminPass.removeClass('has-error');
            }
            if (parentAdminRepass.hasClass('has-error')) {
                parentAdminRepass.removeClass('has-error');
            }
            parentAdminPass.addClass('has-success');
            parentAdminRepass.addClass('has-success');
            parentAdminPass.tooltip('hide');
            parentAdminRepass.tooltip('hide');
        }
    }

    return flag;
}

function checkSaveAdmin(){
    var flag=true;
    return flag;
}

function checkSubject(){
    var flag = true;
    return flag;
}

function checkBatch(){
    var flag = true;
    return flag;
}

function  checkcreateStudent(){
    var flag=true;
    return flag;
}
function checkeditStudent(){
    var flag=true;
    return flag;
}
