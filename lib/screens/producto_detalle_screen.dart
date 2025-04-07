import 'package:flutter/material.dart';

class ProductoDetalleScreen extends StatelessWidget {
  final Map<String, dynamic> producto;

  const ProductoDetalleScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto['titulo'] ?? 'Detalle del producto'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.inventory, size: 60, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Título
              Text(
                producto['titulo'] ?? 'Sin título',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Información detallada
              _buildDetailRow(
                context,
                'Precio',
                '${producto['precio']?.toStringAsFixed(2) ?? '0.00'}€',
                Icons.euro,
                Colors.green,
              ),

              _buildDetailRow(
                context,
                'Stock disponible',
                producto['stock']?.toString() ?? '0',
                Icons.inventory,
                (producto['stock'] ?? 0) <= 5 ? Colors.red : Colors.blue,
              ),

              if (producto['categoria'] != null)
                _buildDetailRow(
                  context,
                  'Categoría',
                  producto['categoria'],
                  Icons.category,
                  Colors.orange,
                ),

              const SizedBox(height: 20),

              // Descripción
              const Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                producto['descripcion'] ?? 'No hay descripción disponible',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
