import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../widgets/custom_drawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int? _selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CustomAppBar(title: "Sobre o App"),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sobre o Projeto",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Este aplicativo foi desenvolvido com o intuito de aprendizado e "
                  "como parte do meu portfólio. O foco principal está em jogos e "
                  "reviews, explorando diferentes conceitos de design, "
                  "desenvolvimento e integração no Flutter.",
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.4),
            ),

            const SizedBox(height: 28),

            // Seção Funcionalidades
            Text(
              "Funcionalidades",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            _buildFeatureCard(
              context,
              Icons.sports_esports,
              "Catálogo de jogos",
              "Explore uma lista variada de jogos com detalhes.",
            ),
            _buildFeatureCard(
              context,
              Icons.rate_review,
              "Avaliações e reviews",
              "Compartilhe e descubra opiniões sobre jogos.",
            ),
            _buildFeatureCard(
              context,
              Icons.star,
              "Destaques e recomendações",
              "Veja os jogos mais recomendados pela comunidade.",
            ),

            const SizedBox(height: 28),

            // Seção Objetivo
            Text(
              "Objetivo",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: theme.colorScheme.surfaceVariant.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Mais do que apenas um app, este projeto é uma forma de consolidar "
                      "meus estudos em Flutter, boas práticas de desenvolvimento e "
                      "design de interfaces. Ele também serve como uma vitrine do meu "
                      "trabalho para oportunidades futuras.",
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (_selectedIndex == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (_selectedIndex == 1) {
            Navigator.pushNamed(context, '/search');
          } else if (_selectedIndex == 2) {
            Navigator.pushNamed(context, '/explore');
          }
        },
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, IconData icon, String title, String subtitle) {
    final theme = Theme.of(context);
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, color: theme.colorScheme.primary),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall,
        ),
      ),
    );
  }
}
