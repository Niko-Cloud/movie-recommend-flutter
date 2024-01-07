import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
class Genre extends Equatable {
  const Genre({required this.name, this.id = 0, this.isSelected = false});

  final String name;
  final bool isSelected;
  final int id;


  Genre toggleSelected(){
    return Genre(name: name,id: id, isSelected: !isSelected);
  }

  @override
  String toString() => "Genre(name: $name, isSelected: $isSelected, id: $id)";

  @override
  List<Object> get props => [name, isSelected, id];
}

