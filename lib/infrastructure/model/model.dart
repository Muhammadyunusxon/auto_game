class ResponseModel {
  ClickerUser? clickerUser;

  ResponseModel({this.clickerUser});

  ResponseModel copyWith({ClickerUser? clickerUser}) =>
      ResponseModel(clickerUser: clickerUser ?? this.clickerUser);

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        clickerUser: json["clickerUser"] == null
            ? null
            : ClickerUser.fromJson(json["clickerUser"]),
      );

  Map<String, dynamic> toJson() => {
        "clickerUser": clickerUser?.toJson(),
      };
}

class ClickerUser {
  String? id;
  double? totalCoins;
  double? balanceCoins;
  int? level;
  int? availableTaps;
  int? lastSyncUpdate;
  String? exchangeId;
  Boosts? boosts;
  Map<String, Upgrade>? upgrades;
  Tasks? tasks;
  int? referralsCount;
  int? maxTaps;
  int? earnPerTap;
  double? earnPassivePerSec;
  int? earnPassivePerHour;
  double? lastPassiveEarn;
  int? tapsRecoverPerSec;
  Referral? referral;

  ClickerUser({
    this.id,
    this.totalCoins,
    this.balanceCoins,
    this.level,
    this.availableTaps,
    this.lastSyncUpdate,
    this.exchangeId,
    this.boosts,
    this.upgrades,
    this.tasks,
    this.referralsCount,
    this.maxTaps,
    this.earnPerTap,
    this.earnPassivePerSec,
    this.earnPassivePerHour,
    this.lastPassiveEarn,
    this.tapsRecoverPerSec,
    this.referral,
  });

  ClickerUser copyWith({
    String? id,
    double? totalCoins,
    double? balanceCoins,
    int? level,
    int? availableTaps,
    int? lastSyncUpdate,
    String? exchangeId,
    Boosts? boosts,
    Map<String, Upgrade>? upgrades,
    Tasks? tasks,
    int? referralsCount,
    int? maxTaps,
    int? earnPerTap,
    double? earnPassivePerSec,
    int? earnPassivePerHour,
    double? lastPassiveEarn,
    int? tapsRecoverPerSec,
    Referral? referral,
  }) =>
      ClickerUser(
        id: id ?? this.id,
        totalCoins: totalCoins ?? this.totalCoins,
        balanceCoins: balanceCoins ?? this.balanceCoins,
        level: level ?? this.level,
        availableTaps: availableTaps ?? this.availableTaps,
        lastSyncUpdate: lastSyncUpdate ?? this.lastSyncUpdate,
        exchangeId: exchangeId ?? this.exchangeId,
        boosts: boosts ?? this.boosts,
        upgrades: upgrades ?? this.upgrades,
        tasks: tasks ?? this.tasks,
        referralsCount: referralsCount ?? this.referralsCount,
        maxTaps: maxTaps ?? this.maxTaps,
        earnPerTap: earnPerTap ?? this.earnPerTap,
        earnPassivePerSec: earnPassivePerSec ?? this.earnPassivePerSec,
        earnPassivePerHour: earnPassivePerHour ?? this.earnPassivePerHour,
        lastPassiveEarn: lastPassiveEarn ?? this.lastPassiveEarn,
        tapsRecoverPerSec: tapsRecoverPerSec ?? this.tapsRecoverPerSec,
        referral: referral ?? this.referral,
      );

  factory ClickerUser.fromJson(Map<String, dynamic> json) => ClickerUser(
        id: json["id"],
        totalCoins: json["totalCoins"]?.toDouble(),
        balanceCoins: json["balanceCoins"]?.toDouble(),
        level: json["level"],
        availableTaps: json["availableTaps"],
        lastSyncUpdate: json["lastSyncUpdate"],
        exchangeId: json["exchangeId"],
        boosts: json["boosts"] == null ? null : Boosts.fromJson(json["boosts"]),
        upgrades: Map.from(json["upgrades"]!)
            .map((k, v) => MapEntry<String, Upgrade>(k, Upgrade.fromJson(v))),
        tasks: json["tasks"] == null ? null : Tasks.fromJson(json["tasks"]),
        referralsCount: json["referralsCount"],
        maxTaps: json["maxTaps"],
        earnPerTap: json["earnPerTap"],
        earnPassivePerSec: json["earnPassivePerSec"]?.toDouble(),
        earnPassivePerHour: json["earnPassivePerHour"],
        lastPassiveEarn: json["lastPassiveEarn"]?.toDouble(),
        tapsRecoverPerSec: json["tapsRecoverPerSec"],
        referral: json["referral"] == null
            ? null
            : Referral.fromJson(json["referral"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalCoins": totalCoins,
        "balanceCoins": balanceCoins,
        "level": level,
        "availableTaps": availableTaps,
        "lastSyncUpdate": lastSyncUpdate,
        "exchangeId": exchangeId,
        "boosts": boosts?.toJson(),
        "upgrades": Map.from(upgrades!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "tasks": tasks?.toJson(),
        "referralsCount": referralsCount,
        "maxTaps": maxTaps,
        "earnPerTap": earnPerTap,
        "earnPassivePerSec": earnPassivePerSec,
        "earnPassivePerHour": earnPassivePerHour,
        "lastPassiveEarn": lastPassiveEarn,
        "tapsRecoverPerSec": tapsRecoverPerSec,
        "referral": referral?.toJson(),
      };
}

class Boosts {
  Upgrade? boostMaxTaps;
  Upgrade? boostFullAvailableTaps;

  Boosts({
    this.boostMaxTaps,
    this.boostFullAvailableTaps,
  });

  Boosts copyWith({
    Upgrade? boostMaxTaps,
    Upgrade? boostFullAvailableTaps,
  }) =>
      Boosts(
        boostMaxTaps: boostMaxTaps ?? this.boostMaxTaps,
        boostFullAvailableTaps:
            boostFullAvailableTaps ?? this.boostFullAvailableTaps,
      );

  factory Boosts.fromJson(Map<String, dynamic> json) => Boosts(
        boostMaxTaps: json["BoostMaxTaps"] == null
            ? null
            : Upgrade.fromJson(json["BoostMaxTaps"]),
        boostFullAvailableTaps: json["BoostFullAvailableTaps"] == null
            ? null
            : Upgrade.fromJson(json["BoostFullAvailableTaps"]),
      );

  Map<String, dynamic> toJson() => {
        "BoostMaxTaps": boostMaxTaps?.toJson(),
        "BoostFullAvailableTaps": boostFullAvailableTaps?.toJson(),
      };
}

class Upgrade {
  String? id;
  int? level;
  int? lastUpgradeAt;
  int? snapshotReferralsCount;

  Upgrade({
    this.id,
    this.level,
    this.lastUpgradeAt,
    this.snapshotReferralsCount,
  });

  Upgrade copyWith({
    String? id,
    int? level,
    int? lastUpgradeAt,
    int? snapshotReferralsCount,
  }) =>
      Upgrade(
        id: id ?? this.id,
        level: level ?? this.level,
        lastUpgradeAt: lastUpgradeAt ?? this.lastUpgradeAt,
        snapshotReferralsCount:
            snapshotReferralsCount ?? this.snapshotReferralsCount,
      );

  factory Upgrade.fromJson(Map<String, dynamic> json) => Upgrade(
        id: json["id"],
        level: json["level"],
        lastUpgradeAt: json["lastUpgradeAt"],
        snapshotReferralsCount: json["snapshotReferralsCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level": level,
        "lastUpgradeAt": lastUpgradeAt,
        "snapshotReferralsCount": snapshotReferralsCount,
      };
}

class Referral {
  Friend? friend;

  Referral({
    this.friend,
  });

  Referral copyWith({
    Friend? friend,
  }) =>
      Referral(
        friend: friend ?? this.friend,
      );

  factory Referral.fromJson(Map<String, dynamic> json) => Referral(
        friend: json["friend"] == null ? null : Friend.fromJson(json["friend"]),
      );

  Map<String, dynamic> toJson() => {
        "friend": friend?.toJson(),
      };
}

class Friend {
  bool? isBot;
  String? firstName;
  String? lastName;
  dynamic addedToAttachmentMenu;
  int? id;
  dynamic isPremium;
  dynamic canReadAllGroupMessages;
  String? languageCode;
  dynamic canJoinGroups;
  dynamic supportsInlineQueries;
  List<dynamic>? photos;
  String? username;
  int? welcomeBonusCoins;

  Friend({
    this.isBot,
    this.firstName,
    this.lastName,
    this.addedToAttachmentMenu,
    this.id,
    this.isPremium,
    this.canReadAllGroupMessages,
    this.languageCode,
    this.canJoinGroups,
    this.supportsInlineQueries,
    this.photos,
    this.username,
    this.welcomeBonusCoins,
  });

  Friend copyWith({
    bool? isBot,
    String? firstName,
    String? lastName,
    dynamic addedToAttachmentMenu,
    int? id,
    dynamic isPremium,
    dynamic canReadAllGroupMessages,
    String? languageCode,
    dynamic canJoinGroups,
    dynamic supportsInlineQueries,
    List<dynamic>? photos,
    String? username,
    int? welcomeBonusCoins,
  }) =>
      Friend(
        isBot: isBot ?? this.isBot,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        addedToAttachmentMenu:
            addedToAttachmentMenu ?? this.addedToAttachmentMenu,
        id: id ?? this.id,
        isPremium: isPremium ?? this.isPremium,
        canReadAllGroupMessages:
            canReadAllGroupMessages ?? this.canReadAllGroupMessages,
        languageCode: languageCode ?? this.languageCode,
        canJoinGroups: canJoinGroups ?? this.canJoinGroups,
        supportsInlineQueries:
            supportsInlineQueries ?? this.supportsInlineQueries,
        photos: photos ?? this.photos,
        username: username ?? this.username,
        welcomeBonusCoins: welcomeBonusCoins ?? this.welcomeBonusCoins,
      );

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        isBot: json["isBot"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        addedToAttachmentMenu: json["addedToAttachmentMenu"],
        id: json["id"],
        isPremium: json["isPremium"],
        canReadAllGroupMessages: json["canReadAllGroupMessages"],
        languageCode: json["languageCode"],
        canJoinGroups: json["canJoinGroups"],
        supportsInlineQueries: json["supportsInlineQueries"],
        photos: json["photos"] == null
            ? []
            : List<dynamic>.from(json["photos"]!.map((x) => x)),
        username: json["username"],
        welcomeBonusCoins: json["welcomeBonusCoins"],
      );

  Map<String, dynamic> toJson() => {
        "isBot": isBot,
        "firstName": firstName,
        "lastName": lastName,
        "addedToAttachmentMenu": addedToAttachmentMenu,
        "id": id,
        "isPremium": isPremium,
        "canReadAllGroupMessages": canReadAllGroupMessages,
        "languageCode": languageCode,
        "canJoinGroups": canJoinGroups,
        "supportsInlineQueries": supportsInlineQueries,
        "photos":
            photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
        "username": username,
        "welcomeBonusCoins": welcomeBonusCoins,
      };
}

class Tasks {
  StreakDays? streakDays;
  SelectExchange? subscribeTelegramChannel;
  SelectExchange? subscribeXAccount;
  SelectExchange? selectExchange;
  SelectExchange? subscribeYoutubeChannel;
  SelectExchange? watchYoutubeVideoWc;

  Tasks({
    this.streakDays,
    this.subscribeTelegramChannel,
    this.subscribeXAccount,
    this.selectExchange,
    this.subscribeYoutubeChannel,
    this.watchYoutubeVideoWc,
  });

  Tasks copyWith({
    StreakDays? streakDays,
    SelectExchange? subscribeTelegramChannel,
    SelectExchange? subscribeXAccount,
    SelectExchange? selectExchange,
    SelectExchange? subscribeYoutubeChannel,
    SelectExchange? watchYoutubeVideoWc,
  }) =>
      Tasks(
        streakDays: streakDays ?? this.streakDays,
        subscribeTelegramChannel:
            subscribeTelegramChannel ?? this.subscribeTelegramChannel,
        subscribeXAccount: subscribeXAccount ?? this.subscribeXAccount,
        selectExchange: selectExchange ?? this.selectExchange,
        subscribeYoutubeChannel:
            subscribeYoutubeChannel ?? this.subscribeYoutubeChannel,
        watchYoutubeVideoWc: watchYoutubeVideoWc ?? this.watchYoutubeVideoWc,
      );

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        streakDays: json["streak_days"] == null
            ? null
            : StreakDays.fromJson(json["streak_days"]),
        subscribeTelegramChannel: json["subscribe_telegram_channel"] == null
            ? null
            : SelectExchange.fromJson(json["subscribe_telegram_channel"]),
        subscribeXAccount: json["subscribe_x_account"] == null
            ? null
            : SelectExchange.fromJson(json["subscribe_x_account"]),
        selectExchange: json["select_exchange"] == null
            ? null
            : SelectExchange.fromJson(json["select_exchange"]),
        subscribeYoutubeChannel: json["subscribe_youtube_channel"] == null
            ? null
            : SelectExchange.fromJson(json["subscribe_youtube_channel"]),
        watchYoutubeVideoWc: json["watch_youtube_video_wc"] == null
            ? null
            : SelectExchange.fromJson(json["watch_youtube_video_wc"]),
      );

  Map<String, dynamic> toJson() => {
        "streak_days": streakDays?.toJson(),
        "subscribe_telegram_channel": subscribeTelegramChannel?.toJson(),
        "subscribe_x_account": subscribeXAccount?.toJson(),
        "select_exchange": selectExchange?.toJson(),
        "subscribe_youtube_channel": subscribeYoutubeChannel?.toJson(),
        "watch_youtube_video_wc": watchYoutubeVideoWc?.toJson(),
      };
}

class SelectExchange {
  String? id;
  DateTime? completedAt;

  SelectExchange({
    this.id,
    this.completedAt,
  });

  SelectExchange copyWith({
    String? id,
    DateTime? completedAt,
  }) =>
      SelectExchange(
        id: id ?? this.id,
        completedAt: completedAt ?? this.completedAt,
      );

  factory SelectExchange.fromJson(Map<String, dynamic> json) => SelectExchange(
        id: json["id"],
        completedAt: json["completedAt"] == null
            ? null
            : DateTime.parse(json["completedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "completedAt": completedAt?.toIso8601String(),
      };
}

class StreakDays {
  String? id;
  DateTime? completedAt;
  int? days;

  StreakDays({
    this.id,
    this.completedAt,
    this.days,
  });

  StreakDays copyWith({
    String? id,
    DateTime? completedAt,
    int? days,
  }) =>
      StreakDays(
        id: id ?? this.id,
        completedAt: completedAt ?? this.completedAt,
        days: days ?? this.days,
      );

  factory StreakDays.fromJson(Map<String, dynamic> json) => StreakDays(
        id: json["id"],
        completedAt: json["completedAt"] == null
            ? null
            : DateTime.parse(json["completedAt"]),
        days: json["days"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "completedAt": completedAt?.toIso8601String(),
        "days": days,
      };
}
