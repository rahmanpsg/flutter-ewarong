import 'package:e_warong/app/data/models/sembako_model.dart';
import 'package:e_warong/app/modules/agen/controllers/agen_controller.dart';
import 'package:e_warong/app/modules/agen/views/form_sembako.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StokSembako extends GetView<AgenController> {
  const StokSembako({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          final SembakoModel sembakoModel = SembakoModel();
          controller.openFormSembako(sembako: sembakoModel);
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: controller.sembakoList.length,
              itemBuilder: ((context, index) {
                SembakoModel sembako = controller.sembakoList[index];

                return ListTile(
                  isThreeLine: true,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child: sembako.foto != null
                          ? Image.network(
                              sembako.foto!,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.image),
                    ),
                  ),
                  title: Text(sembako.nama),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Harga: ${sembako.getFormatHarga()}'),
                      Text('Stok: ${sembako.stok}'),
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => controller.openFormSembako(
                      sembako: sembako, formType: FormType.edit),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
