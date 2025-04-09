import 'package:flutter/material.dart';
import 'gallery_page.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<String> fyiImages = [
      "https://static.republika.co.id/uploads/images/inpicture_slide/band-queen-_151113141611-389.jpg",
      "https://asset.kompas.com/crops/KdQAVy8sQzW97M6yX3NRi2bycbE=/0x0:660x440/750x500/data/photo/2022/03/19/62358c5f714ec.jpg",
      "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/3970/production/_108240741_beatles-abbeyroad-square-reuters-applecorps.jpg.webp",
    ];

    final List<String> fyiTitles = [
      "Konser Rock Legendaris",
      "Festival Musik Dunia",
      "The Beatles di Abbey Road",
    ];

    final List<String> fyiDates = [
      "01-04-2025",
      "02-04-2025",
      "03-04-2025",
    ];

    final List<String> galleryImages = [
      "https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/esensi/2023/12/1680693471-NME-PARAMORE-HERO-2023@2560x1625.jpeg",
      "https://musikeras.com/wp-content/uploads/2024/08/GREEN_DAY_Alice-Baxley-MKedit.jpg",
      "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/183/2023/09/26/Blink-182-Comeback-2766257144.jpg",
      "https://media.altpress.com/fkdgxpscnt/styles/card-hero/2023/03/07/attachment-avenged-sevenfold.jpg.webp?t=a5a03515.webp",
    ];

    final List<String> albumImages = [
      "https://t2.genius.com/unsafe/788x0/https%3A%2F%2Fimages.genius.com%2F65d837e58042e3d0ed266b95ab086400.697x700x1.jpg",
      "https://distortedsoundmag.com/wp-content/uploads/2024/09/American-Idiot-Green-Day-800x445.jpg",
      "https://townsquare.media/site/366/files/2019/03/Blink-182-Enema-of-the-State.jpg?w=980&q=75",
    ];

    final List<String> albumTitles = [
      "RIOT",
      "American Idiot",
      "Enema of the State",
    ];

    final List<String> albumDescriptions = [
      "Album kedua Paramore yang membawa mereka ke sorotan internasional.",
      "Album punk-rock ikonik dari Green Day.",
      "Album ikonik Blink-182 tahun 1999.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rendy Maulana"),
        actions: [
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (val) {
              final provider = context.read<ThemeProvider>();
              provider.toggleTheme(val);
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/rendy.jpg",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // FYI Section
          Text("FYI", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fyiImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          fyiImages[index],
                          height: 80,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fyiTitles[index],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                fyiDates[index],
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Gallery Section
          Text("Galeri", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(galleryImages.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GalleryPage(imageUrl: galleryImages[index]),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    galleryImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Disc / Album Section
          Text("Disc", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Column(
            children: List.generate(albumImages.length, (index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    albumImages[index],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(albumTitles[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(albumDescriptions[index]),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Bio Section
          Text("Bio", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/rendy.jpg"),
            ),
            title: const Text("Rendy Maulana"),
            subtitle: const Text("Motto hidup saya adalah belajar terus"),
          )
        ],
      ),
    );
  }
}
