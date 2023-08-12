class Message {
    constructor(type = "", teamAbbr="", 
            senderNickname = "", senderEmail,
            receiverNickname = "", receiverEmail="",
            content = "",
            voice = "", banned = false) {
        this.type = type;
        this.teamAbbr = teamAbbr;
        this.senderNickname = senderNickname;
        this.senderEmail = senderEmail;
        this.receiverNickname = receiverNickname;
        this.receiverEmail = receiverEmail;
        this.content = content;
        this.voice = voice;
        this.banned = banned;
    }
}