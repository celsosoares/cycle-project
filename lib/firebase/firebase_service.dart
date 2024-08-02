import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class FirebaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<List<Map<String, dynamic>>> getUsers() async {
    List<Map<String, dynamic>> usersList = [];

    try {
      QuerySnapshot querySnapshot = await usersCollection.get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic>? userData = doc.data() as Map<String, dynamic>?;
        if (userData != null) {
          usersList.add(userData);
        }
      });

      return usersList;
    } catch (e) {
      log('Erro ao obter usuários: $e');
      return usersList;
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('email', isEqualTo: email).get();
      if (querySnapshot.size > 0) {
        DocumentSnapshot docSnapshot = querySnapshot.docs[0];
        return docSnapshot.data() as Map<String, dynamic>;
      } else {
        log('Usuário não encontrado.');
        return null;
      }
    } catch (e) {
      log('Erro ao obter usuário: $e');
      return null;
    }
  }

  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      await usersCollection.add(userData);
      log('Usuário adicionado com sucesso!');
    } catch (e) {
      log('Erro ao adicionar usuário: $e');
    }
  }

}
