class EventModel2 {
  final String image, title, description;
  final int id;

  EventModel2(
      {required this.image,
      required this.title,
      required this.description,
      required this.id});
}

List<EventModel2> event = [
  EventModel2(
      id: 1,
      title: "North Island  ",
      description:
          "tourists often choose us because they enjoy the beautiful nature of Kurdistan. You can try our various activities. We are in Sharbazher - North Island Project in Kunamasi.",
      image: "assets/events/north-island.png"),
  EventModel2(
      id: 2,
      title: "Newroz 🔥",
      description:
          "Newroz 🔥 is a Kurdish celebration, the coming of spring and the new year in Kurdish culture. On the evening of March 20, the first day of the Kurdish year is celebrated by lighting the fire of Newroz and wearing Kurdish national clothes The largest Newroz torch will be lit in Salim Street and Mamayara Hill.",
      image: "assets/events/nawroz.png"),
  EventModel2(
      id: 3,
      title: "Baloon ",
      description:
          "Fly with us🪂 for the first time in Kurdistan try the best adventure🪂parasailing🪂 in the beautiful scenery of Dukan Lake Address: Assyrian Resort, Dukan Lake",
      image: "assets/events/ashur.png"),
  EventModel2(
      id: 4,
      title: "Horse Riding ",
      description:
         "Enjoy horse riding and adventure with the beautiful nature of Sulaimani You tourists can visit our club and do horse riding 🐎Arsh Horse Riding Club🐎 Sulaimani - Karadag Main Road",
      image: "assets/events/arsh-horse-sport.png"),
  EventModel2(
      id: 5,
      title: "Jet Ski",
      description:
      "If you want a real adventure, do not hesitate to try 🏄🏻Jetski in the most beautiful lake in Sulaimani to record the best memories of your trip Address: Assyrian Resort, Dukan Lake",
      image: "assets/events/jetski-adventure.png"),
  EventModel2(
      id: 6,
      title: "Kayak Boats",
      description:"Enjoy the beauty of Dukan Lake 🌊, you tourists can now visit us and experience the boat 🚣🏻kayak 🚣🏻 ♂️ in Dukan Lake Address: Assyrian Resort, Dukan Lake",
      image: "assets/events/kayak-event.png")
];
