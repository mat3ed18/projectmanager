URL = window.URL || window.webkitURL;

var gumStream;
var rec;
var input;

var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext;

function gravar(){
    var constraints = {audio: true, video: false};
    
    $("#recordButton").attr("disabled", true);
    $("#stopButton").attr("disabled", false);
    $("#pauseButton").attr("disabled", false);
    
    navigator.mediaDevices.getUserMedia(constraints).then(function (stream) {
        audioContext = new AudioContext();
        $("#formats").html("Format: 1 channel pcm @ " + audioContext.sampleRate / 1000 + "kHz");
        gumStream = stream;
        input = audioContext.createMediaStreamSource(stream);
        rec = new Recorder(input, {numChannels: 1});
        rec.record();
    }).catch(function (err) {
        $("#recordButton").attr("disabled", false);
        $("#stopButton").attr("disabled", true);
        $("#pauseButton").attr("disabled", true);
    });
}

function parar(){
    $("#stopButton").attr("disabled", true);
    $("#recordButton").attr("disabled", false);
    $("#pauseButton").attr("disabled", true);
    $("#pauseButton").html("Pause");
    
    rec.stop();
    gumStream.getAudioTracks()[0].stop();
    rec.exportWAV(createDownloadLink);
};

function createDownloadLink(blob) {
    var url = URL.createObjectURL(blob);
    var au = $("<audio/>");
    var link = $("<a/>");
    
    var filename = new Date().toISOString();
    
    au.attr("controls", true);
    au.attr("src", url);
    
    // console.log(" >>> " + url);
    
    link.attr("href", url);
    link.attr("download", filename + ".wav");
    link.html("Save to disk");

    var upload = $("<a/>");
    upload.attr("href", "#");
    upload.html("Upload");
    
    var formData = new FormData();
    formData.append("audio", blob);
    
    $.ajax({
        url: `${window.location.origin}/projectmanager/speech`, 
        type: "POST", 
        dataType: "json",
        contentType: false,
        processData: false,
        data: formData,
        success: function (data, statusText, jqXHR) {
            // console.log(data);
        },
        error: function (jqXHR, statusText, error) {
            console.log(jqXHR);
        }
    });
}

$(document).on("click", "#buttonRecorder", function (e){
    $(this).toggleClass("recorder");
    
    if ($(this).hasClass("recorder")) {
        $(this).removeClass("btn-danger").addClass("btn-primary");
        $(this).find("i").removeClass("fa-microphone").addClass("fa-stop");
        var audio = new Audio(`${window.location.origin}/app/public/files/record-in.wav`);
        audio.play();
        gravar();
    } else {
        $(this).removeClass("btn-primary").addClass("btn-danger");
        $(this).find("i").removeClass("fa-stop").addClass("fa-microphone");
        var audio = new Audio(`${window.location.origin}/app/public/files/record-out.wav`);
        audio.play();
        parar();
    }
});

