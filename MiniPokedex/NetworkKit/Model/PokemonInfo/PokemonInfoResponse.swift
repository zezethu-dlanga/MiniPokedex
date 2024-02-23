//
//  PokemonInfoResponse.swift
//  MiniPokedex
//
//  Created by Zezethu Dlanga on 2024/02/20.
//

import Foundation

struct PokemonInfoResponse: Codable {
    let abilities: [AbilitiesModel]?
    let base_eperience: Int?
    let cries: CriesModel?
    let forms: [FormsModel]?
    let game_indices: [GameIndicesModel]?
    let height: Int?
    let id: Int
    let is_default: Bool?
    let location_area_encounters: String?
    let moves: [MovesModel]?
    let name: String?
    let order: Int?
    let species: SpeciesModel?
    let sprites: SpritesModel?
    let stats: [StatsModel]?
    let types: [TypesModel]?
    let weight: Int?
    

    init(abilities: [AbilitiesModel]?, base_eperience: Int?, cries: CriesModel?, forms: [FormsModel]?, game_indices: [GameIndicesModel]?, height: Int?, held_items: [HeldItemsModel]?, id: Int, is_default: Bool?, location_area_encounters: String?, moves: [MovesModel]?,name: String?, order: Int?, species: SpeciesModel?, sprites: SpritesModel?, stats: [StatsModel]?, types: [TypesModel]?, weight: Int?) {
        self.abilities = abilities
        self.base_eperience = base_eperience
        self.cries = cries
        self.forms = forms
        self.game_indices = game_indices
        self.height = height
        self.id = id
        self.is_default = is_default
        self.location_area_encounters = location_area_encounters
        self.moves = moves
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
    }
}


//MARK: - Abilities data
struct AbilitiesModel: Codable {
    let ability: AbilityModel?
    let is_hidden: Bool?
    let slot: Int?
    
    init(ability: AbilityModel?, is_hidden: Bool?, slot: Int?) {
        self.ability = ability
        self.is_hidden = is_hidden
        self.slot = slot
    }
}

struct AbilityModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


//MARK: - Cries data
struct CriesModel: Codable {
    let latest: String?
    let legacy: String?
    
    init(latest: String?, legacy: String?) {
        self.latest = latest
        self.legacy = legacy
    }
}


//MARK: - Forms data
struct FormsModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


//MARK: - Game indices data
struct GameIndicesModel: Codable {
    let game_index: Int?
    let version: VersionModel?
    
    init(game_index: Int?, version: VersionModel?) {
        self.game_index = game_index
        self.version = version
    }
}

struct VersionModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


//MARK: - Held items data
struct HeldItemsModel: Codable {
    let game_index: Int?
    
    init(game_index: Int?) {
        self.game_index = game_index
    }
}


//MARK: - Moves data
struct MovesModel: Codable {
    let move: MoveModel?
    let version_group_details: [VersionGroupDetailsModel]?
    
    init(move: MoveModel?,  version_group_details: [VersionGroupDetailsModel]?) {
        self.move = move
        self.version_group_details = version_group_details
    }
}

struct MoveModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}

struct VersionGroupDetailsModel: Codable {
    let level_learned_at: Int?
    let move_learn_method: MoveLearnModel?
    
    init(level_learned_at: Int?, move_learn_method: MoveLearnModel?) {
        self.level_learned_at = level_learned_at
        self.move_learn_method = move_learn_method
    }
}

struct MoveLearnModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


//MARK: - Species data
struct SpeciesModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


//MARK: - Sprites data
struct SpritesModel: Codable {
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
    let other: OtherModel?
    
    
    init(back_default: String?, back_female: String?, back_shiny: String?, back_shiny_female: String?, front_default: String?, front_female: String?, front_shiny: String?, front_shiny_female: String?, other: OtherModel?) {
        self.back_default = back_default
        self.back_female = back_female
        self.back_shiny = back_shiny
        self.back_shiny_female = back_shiny_female
        self.front_default = front_default
        self.front_female = front_female
        self.front_shiny = front_shiny
        self.front_shiny_female = front_shiny_female
        self.other = other
    }
}

struct OtherModel: Codable {
    let home: HomeModel?
    
    init(home: HomeModel?) {
        self.home = home
    }
}

struct HomeModel: Codable {
    let front_default: String?
    let front_shiny: String?
    
    init(front_default: String?, front_shiny: String?) {
        self.front_default = front_default
        self.front_shiny = front_shiny
    }
}


//MARK: - Stats data
struct StatsModel: Codable {
    let base_stat: Int?
    let effort: Int?
    let stat: StatModel?
    
    init(base_stat: Int?, effort: Int?, stat: StatModel?) {
        self.base_stat = base_stat
        self.effort = effort
        self.stat = stat
    }
}

struct StatModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}


//MARK: - Types data
struct TypesModel: Codable {
    let slot: Int?
    let type: TypeModel?
    
    init(slot: Int?, type: TypeModel?) {
        self.slot = slot
        self.type = type
    }
}

struct TypeModel: Codable {
    let name: String?
    let url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
}
