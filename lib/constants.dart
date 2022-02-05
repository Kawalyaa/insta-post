const String urlAuth = 'https://api.instagram.com/oauth/authorize';
const String appId = '645134416738143';
const String appKey = '138986e104f2403f3cd951d0412f46f8';
const String redirectUri = 'https://github.com/Kawalyaa';
const String responseType = 'code';
const scope = 'user_profile,user_media';

String authUrl = urlAuth +
    '?client_id=' +
    appId +
    '&redirect_uri=' +
    redirectUri +
    '&scope=' +
    scope +
    'response_type=' +
    responseType;

String uri =
    "https://api.instagram.com/oauth/authorize?client_id=645134416738143&redirect_uri=https://github.com/Kawalyaa&scope=user_profile,user_media&response_type=code";
