import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'genre_entity.dart';

@immutable
class Genre extends Equatable {
  const Genre({required this.name, this.id = 0, this.isSelected = false});

  final String name;
  final bool isSelected;
  final int id;

  factory Genre.fromEntity(GenreEntity entity) {
    return Genre(name: entity.name, id: entity.id, isSelected: false);
  }

  Genre toggleSelected() {
    return Genre(name: name, id: id, isSelected: !isSelected);
  }

  @override
  List<Object> get props => [name, isSelected, id];
}
