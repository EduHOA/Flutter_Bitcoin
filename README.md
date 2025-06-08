# Crypto Monitor

![Flutter Version](https://img.shields.io/badge/flutter-%3E%3D3.7.2-blue.svg)
![Dart Version](https://img.shields.io/badge/dart-%3E%3D3.0.0-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

Um aplicativo Flutter moderno para monitoramento de criptomoedas em tempo real, utilizando a API da CoinMarketCap.

## 📱 Funcionalidades

- **Monitoramento em Tempo Real**: Acompanhe os preços das criptomoedas em tempo real
- **Suporte a Múltiplas Moedas**: Visualize preços em BRL (Real Brasileiro)
- **Pesquisa Personalizada**: Busque criptomoedas específicas usando seus símbolos
- **Interface Moderna**: Design limpo e intuitivo com suporte a tema claro/escuro
- **Pull to Refresh**: Atualize os dados facilmente com gesto pull-to-refresh
- **Detalhes Completos**: Visualize informações detalhadas de cada criptomoeda
- **Ordenação Inteligente**: Criptomoedas ordenadas por valor de mercado

## 🚀 Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma
- **Provider**: Gerenciamento de estado
- **HTTP**: Requisições HTTP para a API
- **Intl**: Formatação de números e datas
- **CoinMarketCap API**: API para dados de criptomoedas

## 📋 Pré-requisitos

- Flutter SDK ≥ 3.7.2
- Dart SDK ≥ 3.0.0
- API Key da CoinMarketCap
- Conexão com a Internet

## 🔧 Instalação

1. **Clone o repositório**
   ```bash
   git clone https://seu-repositorio/crypto-monitor.git
   cd crypto-monitor
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Configure a API Key**
   - Obtenha sua API Key em [CoinMarketCap](https://coinmarketcap.com/api/)
   - Substitua a chave no arquivo `lib/services/coin_market_api.dart`

4. **Execute o aplicativo**
   ```bash
   flutter run
   ```

## 📦 Estrutura do Projeto

```
lib/
├── main.dart
├── models/
│   └── cryptocurrency.dart
├── services/
│   └── coin_market_api.dart
├── repositories/
│   └── cryptocurrency_repository.dart
├── viewmodels/
│   └── cryptocurrency_viewmodel.dart
├── views/
│   └── home_screen.dart
├── widgets/
│   └── crypto_tile.dart
└── theme/
    └── app_theme.dart
```

## 💡 Como Usar

1. **Iniciar o Aplicativo**
   - Ao abrir, o app carrega automaticamente as principais criptomoedas

2. **Pesquisar Criptomoedas**
   - Digite os símbolos das criptomoedas desejadas no campo de busca
   - Separe múltiplos símbolos por vírgula (ex: BTC,ETH,SOL)
   - Pressione Enter ou o botão de pesquisa

3. **Atualizar Dados**
   - Puxe a tela para baixo para atualizar os preços
   - Ou use o botão de atualização no campo de busca

4. **Visualizar Detalhes**
   - Toque em uma criptomoeda para ver mais detalhes
   - Veja informações como data de adição e preços em diferentes moedas

## 🔄 Lista de Criptomoedas Padrão

O aplicativo vem configurado com uma lista padrão de criptomoedas populares:
```
BTC, ETH, SOL, BNB, BCH, MKR, AAVE, DOT, SUI, ADA,
XRP, TIA, NEO, NEAR, PENDLE, RENDER, LINK, TON, XAI,
SEI, IMX, ETHFI, UMA, SUPER, FET, USUAL, GALA, PAAL, AERO
```

## ⚠️ Limitações

- O plano gratuito da API CoinMarketCap permite apenas uma moeda de conversão por vez
- Taxa de atualização limitada pela API
- Necessário API Key válida para funcionamento

## 🐛 Tratamento de Erros

O aplicativo inclui tratamento robusto de erros para:
- Falhas de conexão
- Símbolos inválidos
- Limites da API
- Dados ausentes ou malformados

## 🎨 Temas

O aplicativo suporta dois temas:
- **Tema Claro**: Interface clara para ambientes bem iluminados
- **Tema Escuro**: Interface escura para melhor visualização noturna

## 🤝 Contribuindo

1. Faça um Fork do projeto
2. Crie uma Branch para sua Feature (`git checkout -b feature/AmazingFeature`)
3. Faça o Commit de suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Faça o Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Suporte

Para suporte, envie um email para seu-email@exemplo.com ou abra uma issue no repositório.

## 🙏 Agradecimentos

- CoinMarketCap pela API
- Comunidade Flutter
- Contribuidores do projeto 